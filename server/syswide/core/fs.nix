{ ... }: {
  #ZRAM Swap
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

  # sudo zfs create -o mountpoint=legacy iris_pool/ocis
  # sudo zfs set com.sun:auto-snapshot=true iris_pool/ocis
  # sudo chown -R $USER:users /data/ocis
  # OCIS_CONFIG_DIR=/data/ocis/config ocis init
  # OCIS_CONFIG_DIR=/data/ocis/config ocis idm resetpassword
  fileSystems."/data/ocis" = {
    device = "iris_pool/ocis";
    fsType = "zfs";
    options = [ "nofail" ];
    depends = [ "/data" ];
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
}
