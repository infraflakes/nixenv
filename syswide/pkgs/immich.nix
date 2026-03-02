{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  #doas zfs create -o mountpoint=legacy iris_pool/immich
  #doas zfs set com.sun:auto-snapshot=true iris_pool/immich
  fileSystems."/data/immich" = {
    device = "iris_pool/immich";
    fsType = "zfs";
    options = ["nofail"];
    depends = ["/data"]; # Ensures the parent mount is ready first
  };
}
