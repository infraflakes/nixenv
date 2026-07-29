{ ... }: {
  imports = [
    /etc/nixos/hardware-configuration.nix

    ./core/sys.nix
    ./core/graphics.nix
    ./core/nix.nix
    ./core/user.nix
    ./core/networking.nix
    ./core/fs.nix

    ./runtime/k3s.nix
    ./runtime/os.nix

    ./utils/clis.nix
    ./utils/dev.nix
    ./utils/editor.nix
    ./utils/file-manager.nix
  ];
}
