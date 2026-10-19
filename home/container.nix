{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "nixenv";
    homeDirectory = "/home/nixenv";
    stateVersion = "26.11";
  };
  imports = [
    ./config/symlink.nix

    ./modules/editor.nix
    ./modules/file-manager.nix
    ./modules/dev.nix
    ./modules/helpers.nix
  ];
}
