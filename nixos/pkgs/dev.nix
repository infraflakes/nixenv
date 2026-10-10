{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    jujutsu
    git
    diff-so-fancy
    direnv
    podman
    tmux
    ghostty
  ];
}
