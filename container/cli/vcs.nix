{ pkgs, ... }: {
  home.packages = with pkgs; [
    openssh
    direnv
    diff-so-fancy
  ];
}
