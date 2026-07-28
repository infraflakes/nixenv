{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    diff-so-fancy
    direnv
    podman
    tmux
  ];
}
