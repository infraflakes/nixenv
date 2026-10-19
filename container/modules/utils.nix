{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    home-manager
    bash
    fd
    fzf
    ripgrep
    less
    tmux
  ];
}
