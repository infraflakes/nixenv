{
  username,
  pkgs,
  inputs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "26.11";
    packages = [
      pkgs.home-manager
      inputs.sutils.packages.${pkgs.stdenv.hostPlatform.system}.default
      pkgs.fish
    ];
  };
  imports = [
    ./cli/editor.nix
    ./cli/file-manager.nix
    ./cli/vcs.nix
  ];
}
