{pkgs, ...}: {
  home.packages = with pkgs; [
    android-tools
    yazi
    zip
    unzip
    p7zip
    unrar
  ];
}
