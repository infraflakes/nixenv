{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    jujutsu
    git
    direnv
    podman
    tmux
    ghostty
  ];
}
