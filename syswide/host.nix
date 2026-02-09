{
  config,
  pkgs,
  ...
}: {
  imports = [
    # System core
    /etc/nixos/hardware-configuration.nix
    ./core/sys.nix
    ./core/graphics.nix
    ./core/misc.nix
    ./core/user.nix
    ./core/fs.nix

    ./runtime/podman.nix
    ./runtime/ocis.nix
  ];
}
