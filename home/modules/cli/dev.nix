{ pkgs, ... }: {
  home.packages = with pkgs; [
    less
    git
    jujutsu
    openssh
    direnv
  ];
}
