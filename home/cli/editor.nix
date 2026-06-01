{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      neovim
      fd
      fzf
      ripgrep
      gnumake
      opencode
      tree-sitter
      nil
      nixfmt
      stylua
    ];
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
  xdg.configFile."nvim".source = ./config/nvim;
}
