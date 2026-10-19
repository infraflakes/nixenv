{ pkgs, ... }: {
  home.packages = with pkgs; [
    xrandr
    arandr
    maim
    xclip
    xset
    xsetroot
    feh
  ];
  i18n = {
    inputMethod.enable = true;
    inputMethod.type = "fcitx5";
    inputMethod.fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [ qt6Packages.fcitx5-unikey ];
    };
  };
}
