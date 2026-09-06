{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    stylua
    helix
    nixfmt
  ];
}
