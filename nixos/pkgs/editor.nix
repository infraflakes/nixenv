{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    fd
    fzf
    ripgrep
    stylua
    nixfmt
    tree-sitter
  ];
}
