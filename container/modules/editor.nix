{ pkgs, ... }: {
  home.packages = with pkgs; [
    gcc
    helix
    stylua
    nixfmt
    tree-sitter
  ];
}
