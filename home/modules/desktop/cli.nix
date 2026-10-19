{ pkgs, ... }: {
  home.packages = with pkgs; [
    tty-clock
    lm_sensors
    networkmanager
    bluetuith
    fastfetch
    ncdu
    pulsemixer
    brightnessctl
    smartmontools
    htop
    lsof
  ];
}
