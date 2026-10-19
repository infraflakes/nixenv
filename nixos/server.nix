{ ... }: {
  imports = [
    /etc/nixos/hardware-configuration.nix

    ./core/user.nix
    ./core/sys.nix
    ./core/nix.nix
    ./core/networking.nix
    ./core/zfs.nix

    ./runtime/k3s.nix
  ];
}
