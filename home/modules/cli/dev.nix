{ pkgs, ... }: {
  home.packages = with pkgs; [
    less
    tmux
    git
    jujutsu
    openssh
    direnv
  ];
}
