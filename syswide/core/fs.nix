{
  config,
  pkgs,
  ...
}: {
  #sudo zpool create -f -o ashift=12 -O compression=lz4 -O acltype=posixacl -O xattr=sa -O normalization=formD -O mountpoint=none iris_pool /dev/<disk>
  #sudo zfs create -o mountpoint=legacy iris_pool/ocis
  boot.supportedFilesystems = ["zfs"];

  # head -c 8 /etc/machine-id
  networking.hostId = "e4a6f118";

  # 2. Tell Nix to import this pool automatically
  boot.zfs.extraPools = ["iris_pool"];

  # 3. Define the mount point
  fileSystems."/data/ocis" = {
    device = "iris_pool/ocis";
    fsType = "zfs";
    options = ["nofail"];
    depends = ["/data"]; # Ensures the parent mount is ready first
  };
  # doas zfs create iris_pool/memos
  # doas zfs set mountpoint=legacy iris_pool/memos
  # doas zfs set xattr=sa iris_pool/memos
  # Matches ZFS block size closer to SQLite page size
  # doas zfs set recordsize=64k iris_pool/memos

  # Disables "access time" updates every time a file is read (saves massive IO)
  # doas zfs set atime=off iris_pool/memos

  # Moves extended attributes into the inode (major speed boost for Linux)
  # doas zfs set xattr=sa iris_pool/memos
  fileSystems."/data/memos" = {
    device = "iris_pool/memos";
    fsType = "zfs";
    options = ["nofail"];
    depends = ["/data"];
  };
  services.zfs.autoScrub.enable = true;
  services.zfs.autoSnapshot.enable = true;
}
