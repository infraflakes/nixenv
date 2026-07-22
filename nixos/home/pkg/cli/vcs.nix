{ ... }: {
  programs.direnv = {
    enable = true;
  };
  programs.diff-so-fancy = {
    enable = true;
    enableGitIntegration = true;
  };
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "infraflakes@proton.me";
        name = "infraflakes";
      };
      color.diff = {
        meta = "blue";
        frag = "brightyellow";
        old = "red";
        new = "green";
      };
    };
  };

  # Generate key: ssh-keygen -t ed25519 -C "infraflakes@proton.me"
  # ssh-add ~/.ssh/id_ed25519
  # `cat ~/.ssh/id_ed25519.pub` then copy and make new ssh key on github

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = "infraflakes@proton.me";
        name = "infraflakes";
      };
    };
  };
}
