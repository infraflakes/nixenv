{ pkgs, ... }: {
  home.packages = with pkgs; [
    jujutsu
    openssh
    direnv
    diff-so-fancy
  ];
}
