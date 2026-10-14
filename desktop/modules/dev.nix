{ pkgs, ... }: {
  home.packages = with pkgs; [
    jujutsu
    direnv
    less
    tmux
  ];
}
