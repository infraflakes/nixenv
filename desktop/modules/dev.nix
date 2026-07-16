{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    direnv
    less
    stow
    tmux
    podman # require shadow utils from main distro
    openssh
    opencode
  ];
}
