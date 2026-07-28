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
}
