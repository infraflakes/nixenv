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
