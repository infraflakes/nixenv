{ pkgs, ... }: {
  home.packages = with pkgs; [
    neovim
    fd
    fzf
    ripgrep
    stylua
    nixfmt
    tree-sitter
  ];
}
