{ pkgs, ... }: {
  home.packages = with pkgs; [
    openssh
    less
    direnv
    stow
  ];
}
