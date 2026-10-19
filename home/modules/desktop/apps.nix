{ pkgs, ... }: {
  home.packages = with pkgs; [
    proton-vpn
    firefox
    element-desktop
  ];
}
