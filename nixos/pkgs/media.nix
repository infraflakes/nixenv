{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    imv
    mpv
    ffmpeg
    music-discord-rpc
    # showtime
    obs-studio
  ];
}
