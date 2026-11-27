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
  xdg.desktopEntries = {
    bottom = {
      name = "foo";
      exec = "/bin/true";
      noDisplay = true;
    };
    htop = {
      name = "foo";
      exec = "/bin/true";
      noDisplay = true;
    };
    yazi = {
      name = "foo";
      exec = "/bin/true";
      noDisplay = true;
    };
    Helix = {
      name = "foo";
      exec = "/bin/true";
      noDisplay = true;
    };

    nixos-manual = {
      name = "foo";
      exec = "/bin/true";
      noDisplay = true;
    };
    kbd-layout-viewer5 = {
      name = "foo";
      exec = "/bin/true";
      noDisplay = true;
    };
    "org.fcitx.fcitx5-migrator" = {
      name = "foo";
      exec = "/bin/true";
      noDisplay = true;
    };
    fcitx5-configtool = {
      name = "foo";
      exec = "/bin/true";
      noDisplay = true;
    };
    "com.mitchellh.ghostty" = {
      name = "foo";
      exec = "/bin/true";
      noDisplay = true;
    };
  };
}
