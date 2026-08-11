{ ... }: {
  zramSwap.enable = true;

  #doas zpool create -f -o ashift=12 -O compression=lz4 -O acltype=posixacl -O xattr=sa -O normalization=formD -O mountpoint=none iris_pool /dev/<disk>
  boot.supportedFilesystems = [ "zfs" ];

  # head -c 8 /etc/machine-id
  networking.hostId = "e4a6f118";

  # Tell Nix to import this pool automatically
  boot.zfs.extraPools = [ "iris_pool" ];

  services.zfs.autoScrub.enable = true;
  services.zfs.autoSnapshot.enable = true;

  # Enable trim
  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  #doas zfs create -o mountpoint=legacy iris_pool/immich
  #doas zfs set com.sun:auto-snapshot=true iris_pool/immich
  fileSystems."/data/immich" = {
    device = "iris_pool/immich";
    fsType = "zfs";
    options = [ "nofail" ];
    depends = [ "/data" ]; # Ensures the parent mount is ready first
  };

  #doas zfs create -o mountpoint=legacy iris_pool/nextcloud
  #doas zfs set com.sun:auto-snapshot=true iris_pool/nextcloud
  fileSystems."/data/nextcloud" = {
    device = "iris_pool/nextcloud";
    fsType = "zfs";
    options = [ "nofail" ];
    depends = [ "/data" ]; # Ensures the parent mount is ready first
  };

  # services.cron = {
  #   enable = true;
  #   systemCronJobs = [
  #     # "*/15 * * * * root  docker exec --user www-data nextcloud-app php occ preview:pre-generate" #once every 15 min
  #     "0 2 * * * root docker exec --user www-data nextcloud-app php occ preview:pre-generate" # once every day at 2 am
  #   ];
  # };

  #doas zfs create -o mountpoint=legacy iris_pool/tuwunel
  #doas zfs set com.sun:auto-snapshot=true iris_pool/tuwunel
  fileSystems."/data/tuwunel" = {
    device = "iris_pool/tuwunel";
    fsType = "zfs";
    options = [ "nofail" ];
    depends = [ "/data" ]; # Ensures the parent mount is ready first
  };
}
