{ pkgs, ... }: {
  home.packages = with pkgs; [
    tack
    home-manager
    bottom
    ripgrep
    fd
    fzf
    zoxide
    herdr-core
  ];
}
