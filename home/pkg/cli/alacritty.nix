{
  config,
  pkgs,
  ...
}: {
  home.file.".config/alacritty/alacritty.toml".text = ''
    [colors.bright]
    black = "#606079"
    blue = "#8ba9c1"
    cyan = "#bebeda"
    green = "#99b782"
    magenta = "#c9b1ca"
    red = "#e08398"
    white = "#d7d7d7"
    yellow = "#f5cb96"

    [colors.cursor]
    cursor = "#cdcdcd"
    text = "#24283b"

    [colors.normal]
    black = "#252530"
    blue = "#6e94b2"
    cyan = "#aeaed1"
    green = "#7fa563"
    magenta = "#bb9dbd"
    red = "#d8647e"
    white = "#cdcdcd"
    yellow = "#f3be7c"

    [colors.primary]
    background = "#141415"
    foreground = "#cdcdcd"

    [colors.selection]
    background = "#283457"
    text = "#cdcdcd"

    [font]
    size = 11.3

    [font.normal]
    family = "Terminess Nerd Font"
    style = "Regular"

    [terminal.shell]
    args = ["-c", "fish"]
    program = "bash"

    [window]
    decorations = "full"
  '';
}
