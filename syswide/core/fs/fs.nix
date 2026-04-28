{...}: {
  #doas zpool create -f -o ashift=12 -O compression=lz4 -O acltype=posixacl -O xattr=sa -O normalization=formD -O mountpoint=none iris_pool /dev/<disk>
  boot.supportedFilesystems = ["zfs"];

  # head -c 8 /etc/machine-id
  networking.hostId = "e4a6f118";

  # Tell Nix to import this pool automatically
  boot.zfs.extraPools = ["iris_pool"];

  services.zfs.autoScrub.enable = true;
  services.zfs.autoSnapshot.enable = true;
}
