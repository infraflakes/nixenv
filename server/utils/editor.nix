{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gcc
    helix
    stylua
    nixfmt
    tree-sitter
  ];
}
