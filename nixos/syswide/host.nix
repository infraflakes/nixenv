{ ... }: {
  imports = [
    # System core
    /etc/nixos/hardware-configuration.nix
    ./core/nix.nix
    ./core/sys.nix
    ./core/graphics.nix
    ./core/networking.nix

    # User environment
    ./environment/user.nix
    ./environment/profiles.nix
    ./environment/niri.nix
    ./environment/dms.nix

    # Programs that needs privileges
    ./runtime/ppd.nix
    ./runtime/mount.nix
    ./runtime/gaming.nix
  ];
}
