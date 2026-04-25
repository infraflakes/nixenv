{...}: {
  imports = [
    # CLI
    # ./cli/ai.nix
    ./cli/editor.nix
    # ./cli/alacritty.nix
    ./cli/ghostty.nix
    ./cli/file-manager.nix
    ./cli/fastfetch.nix
    ./cli/fish.nix
    ./cli/starship.nix
    ./cli/vcs.nix
    ./cli/container.nix
    ./modify-desktop-entry.nix
    ./cli/zellij.nix

    ./media/multimedia.nix
    ./media/others.nix
  ];
}
