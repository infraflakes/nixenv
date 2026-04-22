{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop
    proton-vpn
  ];
}
