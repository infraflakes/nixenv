{ pkgs, ... }: {
  home.packages = with pkgs; [
    proton-vpn
    firefox
    onlyoffice-desktopeditors
  ];
}
