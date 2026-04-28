{...}: {
  imports = [
    # CLI
    ./cli/file-manager.nix
    ./cli/fastfetch.nix
    ./cli/fish.nix
    ./cli/vcs.nix
    ./cli/container.nix
    ./cli/zellij.nix
  ];
}
