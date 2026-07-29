{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    stylua
    nixfmt
    tree-sitter
  ];
}
