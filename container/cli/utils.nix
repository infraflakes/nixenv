{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    home-manager
    bash
    inputs.sutils.packages.${pkgs.stdenv.hostPlatform.system}.default
    fd
    fzf
    ripgrep
    less
    stow
  ];
}
