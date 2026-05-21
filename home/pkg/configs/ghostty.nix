{...}: {
  # Ghostty relies on system's opengl
  # install ghostty with distro's package manager
  # Is way more hassle free
  home.file.".config/ghostty/config".text = ''
    confirm-close-surface = false
    font-family = JetBrains Mono Nerd Font
    font-size = 13
    keybind = clear
    keybind = performable:ctrl+c=copy_to_clipboard
    keybind = ctrl+v=paste_from_clipboard
    theme = TokyoNight Night
    # theme = Catppuccin Frappe
    # theme = Kanagawa Wave
    # background = 1b1e25
    # window-decoration = false
  '';
}
