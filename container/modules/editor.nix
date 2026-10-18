{ pkgs, ... }: {
  home.packages = with pkgs; [
    helix
    neovim
    stylua
    nixfmt
    tree-sitter
  ];
}
