{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    imv
    # mpv
    ffmpeg
    obs-studio
  ];
}
