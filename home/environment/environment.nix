{...}: {
  imports = [
    ./wm/sway.nix
    ./wm/swaylock.nix
    ./wm/mako.nix
    ./wm/rofi.nix
    ./wm/waybar.nix
    ./wm/scripts.nix

    ./ui/fonts.nix
    ./ui/theme.nix
    ./ui/wallpapers.nix

    ./sys/autostart.nix
    ./sys/ime.nix
    ./sys/modify-desktop-entry.nix
  ];
}
