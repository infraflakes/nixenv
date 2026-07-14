{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      neovim
      stylua
      nixfmt
      tree-sitter
    ];
  };
}
