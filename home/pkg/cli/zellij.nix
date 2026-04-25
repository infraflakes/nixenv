{...}: {
  programs.zellij = {
    enable = true;
    extraConfig = ''
      options {
          show_startup_tips false
      }
    '';
    # Zellij handles the shell integration automatically
    enableFishIntegration = true;
    settings = {
      theme = "nord";
      default_layout = "compact"; # Similar to the clean tmux look
      pane_frames = false; # Keeps it sleek like your tmux setup
      ui = {
        pane_frames = {
          rounded_corners = true;
        };
      };
    };
  };
}
