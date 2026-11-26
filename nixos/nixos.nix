{ pkgs, ... }: {

  boot.kernelPackages = pkgs.linuxPackages_latest;
  programs.fish.enable = true;
  users = {
    defaultUserShell = pkgs.fish;
    users.infraflakes = {
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
    # System core
    /etc/nixos/hardware-configuration.nix

    ./core/nix.nix
    ./core/sys.nix
    ./core/sound_and_bluetooth.nix
    ./core/graphics/nvidia.nix
    # ./core/graphics/intel.nix
    ./core/networking.nix

    # User environment
    ./environment/ime.nix
    ./environment/theme.nix
    ./environment/niri.nix
    # ./environment/gnome.nix
    # ./environment/x11.nix

    # Programs that needs privileges
    ./runtime/power.nix
    ./runtime/mount.nix
    ./runtime/flatpak.nix
    ./runtime/gaming.nix
    ./runtime/rex.nix
  ];
}
