{ pkgs, ... }: {
  home.pointerCursor = {
    enable = true;
    name = "Bibata-Modern-Ice";
    size = 24;
    package = pkgs.bibata-cursors;
    gtk.enable = true;
  };
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      size = 24;
      name = "Bibata-Modern-Classic";
    };
    iconTheme = {
      package = pkgs.whitesur-icon-theme;
      name = "WhiteSur-dark";
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        icon-theme = "WhiteSur-dark";
        font-name = "JetBrainsMono Nerd Font 12";
        document-font-name = "JetBrainsMono Nerd Font 12";
        monospace-font-name = "JetBrainsMono Nerd Font 12";
      };
    };
  };
}
