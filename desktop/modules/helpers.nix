{ pkgs, ... }: {
  home.packages = with pkgs; [
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
