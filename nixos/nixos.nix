{ ... }: {
  imports = [
    # System core
    /etc/nixos/hardware-configuration.nix

    ./core/user.nix
    ./core/nix.nix
    ./core/sys.nix
    ./core/sound_and_bluetooth.nix
    ./core/graphics/nvidia.nix
    ./core/networking.nix

    # User environment
    ./environment/ime.nix
    ./environment/theme.nix
    ./environment/gnome.nix

    # Programs that needs privileges
    ./runtime/ppd.nix
    ./runtime/mount.nix
    ./runtime/gaming.nix
  ];
}
