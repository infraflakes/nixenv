{ pkgs, ... }: {
  home.packages = with pkgs; [ xdg-utils ];
  imports = [
    ./wm/sway.nix
    ./wm/swaylock.nix
    ./wm/mako.nix
    ./wm/rofi.nix
    ./wm/waybar.nix
    ./wm/scripts.nix

    ./theme/fonts.nix
    ./theme/theme.nix
    ./theme/wallpapers.nix

    ./sys/ime.nix
    ./sys/modify-desktop-entry.nix
  ];
}
