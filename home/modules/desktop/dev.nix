{ pkgs, ... }: {
  home.packages = with pkgs; [
    jujutsu
    git
    direnv
    podman
    tmux
  ];
}
