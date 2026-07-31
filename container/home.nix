{
  pkgs,
  inputs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "nixenv";
    homeDirectory = "/home/nixenv";
    stateVersion = "26.11";
    packages = [
      pkgs.home-manager
      pkgs.bash
    ];
  };
  imports = [
    ./cli/editor.nix
    ./cli/file-manager.nix
    ./cli/vcs.nix
    ./cli/utils.nix
  ];
}
