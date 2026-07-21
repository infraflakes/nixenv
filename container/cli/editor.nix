{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      neovim
      fd
      fzf
      ripgrep
      gnumake
      tree-sitter
      nil
      nixfmt
      stylua
    ];
  };
}
