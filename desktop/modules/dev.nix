{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    openssh
    podman
    direnv
    less
    stow
    tmux
  ];
}
