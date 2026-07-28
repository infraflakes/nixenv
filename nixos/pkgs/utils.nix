{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    stow
    inputs.sutils.packages.${pkgs.stdenv.hostPlatform.system}.default
    fastfetch
    htop
    ncdu
    bottom
    lm_sensors
    bluetuith
    pulsemixer
    brightnessctl
  ];
}
