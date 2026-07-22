{ pkgs, ... }: {
  home.packages = with pkgs; [
    # zoom-us
    vesktop
    firefox
    proton-vpn
  ];
}
