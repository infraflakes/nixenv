{ pkgs, ... }: {
  nix.settings = {
    trusted-users = [
      "root"
      "nixuris"
    ];
    cores = 0;
    max-jobs = "auto";
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  system.stateVersion = "26.11";
  nixpkgs.config.allowUnfree = true;
}
