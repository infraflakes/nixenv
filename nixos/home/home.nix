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
      inputs.sutils.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
  imports = [
    ./pkg/pkgs.nix
    ./environment/environment.nix
  ];
}
