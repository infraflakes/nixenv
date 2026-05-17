{pkgs, ...}: {
  home.packages = with pkgs; [
    playerctl
    pavucontrol
  ];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        include = [
          #"${./config/waybar/badge/badge.jsonc}"
          "${./config/waybar/clean/top/top.jsonc}"
        ];
      };
      sideBar = {
        include = [
          "${./config/waybar/clean/side/side.jsonc}"
        ];
      };
    };
  };

  home.file = {
    ".config/waybar/style.css" = {
      text = ''
        @import url("${./config/waybar/clean/clean.css}");
      '';
    };
    ".config/waybar/clean" = {
      source = ./config/waybar/clean;
    };
    ".config/waybar/badge" = {
      source = ./config/waybar/badge;
    };
  };
}
