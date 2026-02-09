{
  config,
  pkgs,
  ...
}: {
  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/03aa78a4-848f-41ed-aa80-6e435a54932a";
    fsType = "ext4";
    options = ["nofail" "user"];
  };
}
