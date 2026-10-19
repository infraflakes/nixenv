{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
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
