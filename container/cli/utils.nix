{ pkgs, ... }: {
  home.packages = with pkgs; [
    inputs.sutils.packages.${pkgs.stdenv.hostPlatform.system}.default
    fd
    fzf
    ripgrep
    less
    stow
  ];
}
