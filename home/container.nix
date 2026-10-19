{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "nixenv";
    homeDirectory = "/home/nixenv";
    stateVersion = "26.11";
  };
  imports = [
    ./config/symlink.nix

    ./modules/cli/editor.nix
    ./modules/cli/file-manager.nix
    ./modules/cli/dev.nix
    ./modules/cli/helpers.nix
  ];
}
