{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gcc
    helix
    neovim
    stylua
    nixfmt
    tree-sitter
  ];
}
