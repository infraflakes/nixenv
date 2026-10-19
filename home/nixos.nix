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

    ./modules/desktop/apps.nix
    ./modules/desktop/cli.nix
    ./modules/desktop/fonts.nix

    ./modules/cli/helpers.nix
    ./modules/cli/dev.nix
    ./modules/cli/file-manager.nix
    ./modules/cli/editor.nix
  ];
}
