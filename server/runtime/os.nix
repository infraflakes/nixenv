{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    bottom
    lm_sensors
    smartmontools
    htop
    ncdu
    bottom
    lm_sensors
    lsof
  ];
}
