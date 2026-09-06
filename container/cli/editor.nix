{ pkgs, ... }: {
  home.packages = with pkgs; [
    neovim
    stylua
    helix
    nixfmt
  ];
}
