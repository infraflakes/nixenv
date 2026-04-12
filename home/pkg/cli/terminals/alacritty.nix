{...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      # keyboard.bindings = [
      #   {
      #     key = "C";
      #     mods = "Control";
      #     action = "Copy";
      #   }
      #   {
      #     key = "V";
      #     mods = "Control";
      #     action = "Paste";
      #   }
      # ];
      font = {
        normal = {
          family = "JetBrains Mono Nerd Font";
          style = "Regular";
        };
        size = 13;
      };
      terminal.shell = {
        program = "bash";
        args = [
          "-c"
          "fish"
        ];
      };
      window = {
        #opacity = 0.8;
        decorations = "full";
        # padding = {
        #   x = 15;
        #   y = 15;
        # };
      };

      colors = {
        primary = {
          background = "#303446";
          foreground = "#c6d0f5";
        };
        cursor = {
          text = "#1e1e2e";
          cursor = "#f5e0dc";
        };
        selection = {
          text = "#cdd6f4";
          background = "#45475a";
        };
        normal = {
          black = "#45475a";
          red = "#f38ba8";
          green = "#a6e3a1";
          yellow = "#f9e2af";
          blue = "#89b4fa";
          magenta = "#f5c2e7";
          cyan = "#94e2d5";
          white = "#bac2de";
        };
        bright = {
          black = "#585b70";
          red = "#f38ba8";
          green = "#a6e3a1";
          yellow = "#f9e2af";
          blue = "#89b4fa";
          magenta = "#f5c2e7";
          cyan = "#94e2d5";
          white = "#a6adc8";
        };
      };
    };
  };
}
