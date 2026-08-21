{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    usbutils
    libimobiledevice
    ifuse
    android-tools
  ];
  services = {
    udisks2.enable = true;
    usbmuxd.enable = true;
  };
}
