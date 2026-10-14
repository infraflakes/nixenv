{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    inputs.sutils.packages.${pkgs.stdenv.hostPlatform.system}.default
    fastfetch
    htop
    ncdu
    bottom
    tty-clock
    lm_sensors
    bluetuith
    pulsemixer
    brightnessctl
    fd
    fzf
    ripgrep
  ];
}
