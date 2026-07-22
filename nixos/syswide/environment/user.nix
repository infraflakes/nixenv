{
  pkgs,
  ...
}:
{
  programs.fish.enable = true;
  users = {
    defaultUserShell = pkgs.fish;
    users.nixuris = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        "adbusers"
        "podman"
        "libvirtd"
        "kvm"
      ];
    };
  };
}
