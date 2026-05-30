{...}: {
  programs.zellij = {
    enable = true;
    extraConfig = ''
      show_startup_tips false
    '';
    settings = {
      theme = "tokyo-night-dark";
      default_layout = "compact";
      pane_frames = false;
      ui = {
        pane_frames = {
          rounded_corners = true;
        };
      };
    };
  };
}
