{pkgs, ...}: {
  home.packages = with pkgs; [
    git
    openssh
    less
    direnv
    stow
  ];

  # Generate key: ssh-keygen -t ed25519 -C "infraflakes@proton.me"
  # ssh-add ~/.ssh/id_ed25519
  # `cat ~/.ssh/id_ed25519.pub` then copy and make new ssh key on github
}
