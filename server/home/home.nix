{
  pkgs,
  inputs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  home.file.".config/nix/nix.conf".text = ''
    experimental-features = nix-command flakes
  '';
  home = {
    username = "nixuris";
    homeDirectory = "/home/nixuris";
    stateVersion = "26.11";
    packages = [
      pkgs.home-manager
      inputs.sutils.packages.${pkgs.stdenv.hostPlatform.system}.default
      pkgs.wget
      pkgs.bottom
      pkgs.lm_sensors
      pkgs.nmap
      pkgs.smartmontools
      pkgs.htop
      pkgs.ncdu
      pkgs.bottom
      pkgs.lm_sensors
      pkgs.jq
      pkgs.lsof
      pkgs.net-tools
      pkgs.fd
      pkgs.fzf
      pkgs.ripgrep
    ];
  };
  imports = [
    ./cli/editor.nix
    ./cli/file-manager.nix
    ./cli/tmux.nix
    ./cli/vcs.nix
    ./cli/fastfetch.nix
    ./cli/fish.nix
  ];
}
