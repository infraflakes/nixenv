{
  pkgs,
  lib,
  ...
}:
{
  # services.displayManager = {
  # ly.enable = true;
  # gdm.enable = true;
  # };
  services.dbus.packages = [ pkgs.gsettings-desktop-schemas ];
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      # xdg-desktop-portal-gnome
    ];
    config = {
      common = {
        default = [
          "gtk"
        ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };
      # niri = {
      #   default = [
      #     "gnome"
      #     "gtk"
      #   ];
      #   "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
      #   "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
      # };
    };
  };
}
