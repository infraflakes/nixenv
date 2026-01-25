{
  config,
  pkgs,
  ...
}: {
  home.sessionVariables.SHELL = "${pkgs.fish}/bin/fish";
  programs.fish = {
    enable = true;
    shellAliases = {
      tm = "tmux new-session -A";
      cd = "scd";
      cat = "bat";
      rg = "grep";
      se = "sudo -E -s nvim";
      ls = "lsd -l";
    };
    interactiveShellInit = ''
      starship init fish | source
      set username (whoami)
      echo "				Welcome back, $username!"
      export EDITOR=nvim
      fish_add_path .local/bin
      fish_add_path .cargo/bin
      fish_add_path .nix-profile/bin
      scd init fish | source
    '';
    shellInit = ''
      set -g fish_color_command 8ab4f8 --bold
      set -g fish_color_param ccd0d9 --bold
      set -g fish_color_redirection 8ab4f8 --bold
      set -g fish_color_error cf6679 --bold
      set -g fish_color_autosuggestion 908caa --bold
      set -g fish_color_selection --reverse --bold
    '';
    functions.fish_greeting = '''';
  };
}
