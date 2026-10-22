{ pkgs, ... }: {
  home.packages = with pkgs; [
    gcc
    neovim
    # helix
    stylua
    nixfmt
    tree-sitter
  ];
}
