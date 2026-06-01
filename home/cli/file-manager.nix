{ pkgs, ... }: {
  home.packages = with pkgs; [
    yazi
    zip
    unzip
    p7zip
  ];
  xdg.configFile."yazi/yazi.toml".text = ''
    [mgr]
    sort_by = "mtime"
    sort_dir_first = true
    sort_reverse = true
  '';
}
