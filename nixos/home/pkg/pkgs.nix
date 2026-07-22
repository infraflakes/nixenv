{ ... }: {
  imports = [
    # CLI
    ./cli/editor.nix
    ./cli/terminals/alacritty.nix
    ./cli/terminals/ghostty.nix
    ./cli/file-manager.nix
    ./cli/fastfetch.nix
    ./cli/fish.nix
    ./cli/vcs.nix
    ./cli/tmux.nix

    # Media
    ./media/multimedia.nix
    ./media/others.nix
  ];
}
