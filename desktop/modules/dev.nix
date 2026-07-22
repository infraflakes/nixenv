{ pkgs, ... }: {
  home.packages = with pkgs; [
    direnv
    less
    stow
    tmux
  ];
}
