{ pkgs, ... }: {
  home.packages = with pkgs; [
    herdr-desktop
    ghostty
    imv
    # mpv
    ffmpeg
    obs-studio
    proton-vpn
    firefox
    onlyoffice-desktopeditors
  ];
}
