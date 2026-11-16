{ pkgs, ... }: {
  xdg.desktopEntries.spotify = {
    name = "Spotify";
    genericName = "Music Player";
    comment = "Spotify streaming music client";
    exec = "flatpak run com.spotify.Client %U";
    icon = "/var/lib/flatpak/exports/share/icons/hicolor/256x256/apps/com.spotify.Client.png";
    terminal = false;
    type = "Application";
    categories = [
      "Audio"
      "Music"
      "Player"
      "AudioVideo"
    ];
    mimeType = [
      "x-scheme-handler/spotify"
    ];
  };
  home.packages = with pkgs; [
    # proton-vpn
    firefox
  ];
}
