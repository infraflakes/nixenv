{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      neovim
      fd
      fzf
      ripgrep
      gcc
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
