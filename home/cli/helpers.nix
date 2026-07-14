{pkgs, ...}: {
  home.packages = with pkgs; [
    wget
    bottom
    lm_sensors
    nmap
    smartmontools
    htop
    ncdu
    bottom
    lm_sensors
    jq
    lsof
    net-tools
    fd
    fzf
    ripgrep
  ];
}
