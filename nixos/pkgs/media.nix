{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    imv
    mpv
    ffmpeg
    # showtime
    obs-studio
  ];
}
