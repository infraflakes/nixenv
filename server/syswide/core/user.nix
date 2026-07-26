{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [ home-manager ];
  programs.fish.enable = true;
  users.users.nixuris = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
      "podman"
      "docker"
    ];
  };
}
