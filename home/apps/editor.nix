{
  config,
  pkgs,
  lib,
  ...
}: {
  home = {
    packages = with pkgs; [
      fzf
      ripgrep
      gcc
      gnumake
      stylua
      alejandra
    ];
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
  # programs.opencode = {
  #   enable = true;
  #   settings = {
  #     "$schema" = "https://opencode.ai/config.json";
  #     plugin = [
  #       "opencode-antigravity-auth@latest"
  #     ];
  #   };
  # };
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim".source = ./config/nvim;
}
