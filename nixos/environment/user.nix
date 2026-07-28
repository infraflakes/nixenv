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
        "input"
        "video"
        "adbusers"
        "podman"
        "libvirtd"
        "kvm"
      ];
    };
  };
}
