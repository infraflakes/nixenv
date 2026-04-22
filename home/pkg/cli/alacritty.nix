{...}: {
  home.file.".config/alacritty/alacritty.toml".text = ''
    [colors.bright]
    black = "#585b70"
    blue = "#89b4fa"
    cyan = "#94e2d5"
    green = "#a6e3a1"
    magenta = "#f5c2e7"
    red = "#f38ba8"
    white = "#a6adc8"
    yellow = "#f9e2af"

    [colors.cursor]
    cursor = "#f5e0dc"
    text = "#1e1e2e"

    [colors.normal]
    black = "#45475a"
    blue = "#89b4fa"
    cyan = "#94e2d5"
    green = "#a6e3a1"
    magenta = "#f5c2e7"
    red = "#f38ba8"
    white = "#bac2de"
    yellow = "#f9e2af"

    [colors.primary]
    background = "#303446"
    foreground = "#c6d0f5"

    [colors.selection]
    background = "#45475a"
    text = "#cdd6f4"

    [font]
    size = 13

    [font.normal]
    family = "JetBrains Mono Nerd Font"
    style = "Regular"

    [terminal.shell]
    args = ["-c", "fish"]
    program = "bash"

    [window]
    decorations = "full"

  '';
}
