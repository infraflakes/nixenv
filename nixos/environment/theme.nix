{ pkgs, ... }: {

  # 1. Install required packages system-wide
  environment.systemPackages = with pkgs; [
    bibata-cursors
    whitesur-icon-theme
  ];

  # 2. GTK 3 global configuration
  environment.etc."xdg/gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name=Adwaita
    gtk-icon-theme-name=WhiteSur-dark
    gtk-cursor-theme-name=Bibata-Modern-Classic
    gtk-cursor-theme-size=24
    gtk-font-name=JetBrainsMono Nerd Font 12
  '';

  # 3. System-wide DConf / GSettings defaults
  programs.dconf.enable = true;

  services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.desktop.interface]
    icon-theme='WhiteSur-dark'
    cursor-theme='Bibata-Modern-Classic'
    cursor-size=24
    font-name='JetBrainsMono Nerd Font 12'
    document-font-name='JetBrainsMono Nerd Font 12'
    monospace-font-name='JetBrainsMono Nerd Font 12'
  '';

  environment.variables.XCURSOR_SIZE = "24";
  environment.variables.XCURSOR_THEME = "Bibata-Modern-Ice";
}
