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
    ./environment/ime.nix
    ./environment/fonts.nix
    ./environment/x11.nix

    # Programs that needs privileges
    ./runtime/ppd.nix
    ./runtime/mount.nix
    ./runtime/gaming.nix

    # Packages
    ./pkgs/dev.nix
    ./pkgs/editor.nix
    ./pkgs/file-manager.nix
    ./pkgs/media.nix
    ./pkgs/social.nix
    ./pkgs/utils.nix
  ];
}
