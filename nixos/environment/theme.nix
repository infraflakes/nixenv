{ pkgs, ... }: {
  fonts = {
    fontconfig = {
      enable = true;
      # Force fontconfig to override Braille Unicode range with solid dots
      localConf = ''
        <fontconfig>
          <match target="pattern">
            <test name="family"><string>monospace</string></test>
            <edit name="family" mode="prepend" binding="strong">
              <string>Noto Sans Symbols 2</string>
            </edit>
          </match>
        </fontconfig>
      '';
    };
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      nerd-fonts.jetbrains-mono
    ];
  };

  # Install required packages system-wide
  environment.systemPackages = with pkgs; [
    bibata-cursors
    whitesur-icon-theme
  ];

  # GTK 3 global configuration
  environment.etc."xdg/gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name=Adwaita
    gtk-icon-theme-name=WhiteSur-dark
    gtk-cursor-theme-name=Bibata-Modern-Classic
    gtk-cursor-theme-size=24
    gtk-font-name=JetBrainsMono Nerd Font 12
  '';

  # System-wide DConf / GSettings defaults
  programs.dconf.enable = true;
  services.dbus.packages = [ pkgs.gsettings-desktop-schemas ];

  services.desktopManager.gnome.extraGSettingsOverrides = ''
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
