{
  pkgs,
  inputs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "infraflakes";
    homeDirectory = "/home/infraflakes";
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
    ./modules/desktop/dev.nix

    ./modules/cli/helpers.nix
    ./modules/cli/file-manager.nix
    ./modules/cli/editor.nix
  ];
}
