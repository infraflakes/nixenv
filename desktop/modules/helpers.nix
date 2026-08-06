{ pkgs, ... }: {
  home.packages = with pkgs; [
    tty-clock
    bottom
    lm_sensors
    networkmanager
    bluetuith
    fastfetch
    ncdu
    ripgrep
    fd
    fzf
  ];
}
