{ pkgs, ... }: {
  home.packages = with pkgs; [
    gcc
    helix
    neovim
    stylua
    nixfmt
    tree-sitter
  ];
}
