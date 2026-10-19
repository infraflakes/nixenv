{
  pkgs,
  inputs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "nixuris";
    homeDirectory = "/home/nixuris";
    stateVersion = "26.11";
    packages = [
      pkgs.home-manager
    ];
  };
  imports = [
    ./config/symlink.nix

    ./modules/desktop/dev.nix
    ./modules/desktop/cli.nix

    ./modules/cli/helpers.nix
    ./modules/cli/file-manager.nix
    ./modules/cli/editor.nix
  ];
}
