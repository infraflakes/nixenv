{ ... }: {
  imports = [
    # System core
    /etc/nixos/hardware-configuration.nix
    ./core/sys.nix
    ./core/graphics.nix
    ./core/nix.nix
    ./core/user.nix
    ./core/networking.nix
    ./core/fs.nix

    ./pkgs/k3s.nix
    ./pkgs/docker.nix
    ./pkgs/ocis.nix
  ];
}
