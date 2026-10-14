{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "nixenv";
    homeDirectory = "/home/nixenv";
    stateVersion = "26.11";
  };
  imports = [
    ./modules/editor.nix
    ./modules/file-manager.nix
    ./modules/vcs.nix
    ./modules/utils.nix
    ./modules/symlink.nix
  ];
}
