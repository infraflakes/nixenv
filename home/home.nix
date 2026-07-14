{
  pkgs,
  inputs,
  username,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home.file.".config/nix/nix.conf".text = ''
    experimental-features = nix-command flakes
  '';
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
    ./cli/helpers.nix
  ];
}
