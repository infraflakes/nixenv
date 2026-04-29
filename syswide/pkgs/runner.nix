{pkgs, ...}: {
  services.github-runners = {
    home-server = {
      enable = true;
      url = "https://github.com/infraflakes/sro";
      tokenFile = "/var/lib/github-runners/token";
      name = "nixos-runner";
      extraLabels = ["nixos" "self-hosted"];
      extraPackages = with pkgs; [
        git
        docker
      ];
    };
  };
}
