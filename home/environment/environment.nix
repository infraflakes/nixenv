{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./srwm/srwm.nix
    ./srwm/rofi.nix
    ./ui/fonts.nix
    ./ui/wallpapers.nix
  ];
}
