{ pkgs, ... }: {
  home.packages = with pkgs; [
    imv
    mpv
    ffmpeg
    music-discord-rpc
    # showtime
  ];
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-backgroundremoval
      obs-gstreamer
      wlrobs
      obs-pipewire-audio-capture
      obs-vaapi
      obs-vkcapture
    ];
  };
}
