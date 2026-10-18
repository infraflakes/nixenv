{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    helix
    neovim
    stylua
    nixfmt
    tree-sitter
  ];
}
