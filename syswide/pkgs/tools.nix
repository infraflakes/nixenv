{
  config,
  pkgs,
  inputs,
  ...
}: {
  #Sys pkgs
  environment.systemPackages = with pkgs; [
    smartmontools
    yazi
    htop
    ncdu
    bottom
    lm_sensors
    ripgrep
    bat
    jq
    lsof
    net-tools
    inputs.srn-coreutils.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.scd.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
