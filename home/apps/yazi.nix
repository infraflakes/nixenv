{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    yazi
    zip
    unzip
    p7zip
    unrar
  ];
  home.file.".config/yazi/yazi.toml".text = ''
        [opener]
    open = [
        { run = 'imv "$@"', desc = "imv", for = "unix", match = "*.{jpg,jpeg,png,gif,webp}" },
        { run = 'xdg-open "$@"', desc = "Open", for = "linux" },
    ]
  '';
}
