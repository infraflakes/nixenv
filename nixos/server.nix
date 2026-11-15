{ pkgs, ... }: {

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
        "docker"
        "libvirtd"
        "kvm"
      ];
    };
  };

  imports = [
    /etc/nixos/hardware-configuration.nix

    ./core/sys.nix
    ./core/nix.nix
    ./core/networking.nix
    ./core/zfs.nix

    ./runtime/k3s.nix
  ];
}
