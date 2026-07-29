{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    inputs.sutils.packages.${pkgs.stdenv.hostPlatform.system}.default
    fastfetch
    fd
    fzf
    ripgrep
    stow
  ];
}
