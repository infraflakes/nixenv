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
    ./modules/editor.nix
    ./modules/file-manager.nix
    ./modules/dev.nix
    ./modules/fonts.nix
    ./modules/helpers.nix
    ./modules/media.nix
    ./modules/x11.nix
  ];
}
