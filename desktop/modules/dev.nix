{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    less
    stow
    tmux
    podman # require shadow utils from main distro
    openssh
    devin-desktop
    opencode
  ];
}
