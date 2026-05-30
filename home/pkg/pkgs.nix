{
  pkgs,
  inputs,
  ...
}: {
  home.packages = [
    inputs.sutils.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.home-manager
    pkgs.bottom
    pkgs.lm_sensors
    pkgs.htop
    pkgs.bluetuith
    pkgs.pulsemixer
    pkgs.nmap
    pkgs.ripgrep
    pkgs.bat
    pkgs.ncdu
    pkgs.proton-vpn
  ];
  imports = [
    ./cli/editor.nix
    ./cli/file-manager.nix
    ./cli/fastfetch.nix
    ./cli/fish.nix
    ./cli/vcs.nix
    ./cli/container.nix
    ./cli/kiru.nix
    ./cli/tmux.nix
    ./configs/ghostty.nix
  ];
}
