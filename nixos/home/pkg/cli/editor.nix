{ pkgs, ... }: {
  home.packages = with pkgs; [
    fd
    fzf
    ripgrep
    stylua
    nixfmt
    clang-tools
    tree-sitter
  ];
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  xdg.configFile."nvim".source = ./config/svim;
}
