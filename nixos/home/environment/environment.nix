{ pkgs, ... }: {
  home.packages = with pkgs; [ xdg-utils ];
  imports = [
    ./niri.nix

    ./theme/fonts.nix
    ./theme/theme.nix
    ./theme/wallpapers.nix

    ./ime.nix
    ./modify-desktop-entry.nix
  ];
}
