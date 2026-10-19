{ pkgs, ... }: {
  home.packages = with pkgs; [
    home-manager
    bottom
    ripgrep
    fd
    fzf
  ];
}
