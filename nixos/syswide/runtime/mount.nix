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
  services.usbmuxd = {
    enable = true;
    package = pkgs.usbmuxd2;
  };
}
