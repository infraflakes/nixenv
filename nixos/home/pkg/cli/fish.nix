{ pkgs, ... }: {
  home = {
    sessionVariables = {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_DESKTOP_DIR = "$HOME/Desktop";
      XDG_DOCUMENTS_DIR = "$HOME/Documents";
      XDG_DOWNLOAD_DIR = "$HOME/Downloads";
      XDG_MUSIC_DIR = "$HOME/Music";
      XDG_PICTURES_DIR = "$HOME/Pictures";
      XDG_STATE_HOME = "$HOME/.local/state";
      XDG_VIDEOS_DIR = "$HOME/Videos";

      EDITOR = "nvim";
      VISUAL = "nvim";
      SHELL = "${pkgs.fish}/bin/fish";
      SSH_AUTH_SOCK = "/run/user/1000/ssh-agent";
    };
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];
  };
  programs.fish = {
    enable = true;
    shellAliases = {
      tm = "tmux new-session -A -s default";
      cd = "scd";
      e = "nvim";
      nvidia-gpu = "__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia";
    };
    interactiveShellInit = ''
      sn cd init fish | source
      fastfetch
      set username (whoami)
      echo "				Welcome back, $username!"
    '';
    shellInit = ''
      set UID (id -u)
      set -g fish_color_command 8ab4f8 --bold
      set -g fish_color_param ccd0d9 --bold
      set -g fish_color_redirection 8ab4f8 --bold
      set -g fish_color_error cf6679 --bold
      set -g fish_color_autosuggestion 908caa --bold
      set -g fish_color_selection --reverse --bold
    '';
    functions = {
      fish_greeting = "";
      fish_prompt = ''
        echo
        set_color -o 4a4b52
        echo -n ""
        set_color normal
        set_color -o 8ab4f8
        set_color -b 4a4b52
        echo -n "  "
        set_color normal
        set_color -o 8ab4f8
        set_color -b 4a4b52
        echo -n (prompt_pwd)
        set_color normal
        set_color -o 4a4b52
        echo -n ""
        set_color normal
        echo -n (set_color -o 8ab4f8)" ❯ "
      '';
    };
  };
}
