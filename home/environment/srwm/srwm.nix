{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.xset
    pkgs.feh
    pkgs.sx
    pkgs.iw
    pkgs.xclip
    pkgs.bc
  ];
}
