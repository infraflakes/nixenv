{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      fd
      fzf
      ripgrep
      gcc
      gnumake
      stylua
      alejandra
      #antigravity
      #windsurf
      opencode
      clang-tools
      tree-sitter

      # Servers
      nil
      # gopls
      rust-analyzer
      zls
      svelte-language-server
      typescript-language-server
    ];
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  xdg.configFile."nvim".source = ./config/srnvim;
}
