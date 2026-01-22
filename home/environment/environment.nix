{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./wm/niri/niri.nix
    ./wm/niri/xwayland.nix
    ./wm/niri/autostart.nix
    ./wm/dms.nix

    ./ui/fonts.nix
    ./ui/theme.nix
    ./ui/wallpapers.nix

    ./sys/ime.nix
    ./sys/modify-desktop-entry.nix
  ];
}
