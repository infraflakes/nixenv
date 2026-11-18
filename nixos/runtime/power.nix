{ pkgs, ... }:
let
  limit = "90";
in
{
  environment.systemPackages = with pkgs; [ pciutils ];
  # services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.asusd.enable = true;
  programs.rog-control-center.enable = true;

  # Enable supergfxctl for GPU switching
  services.supergfxd.enable = true;
  # Fix GPU detection issues where supergfxd cannot find lspci/modprobe
  systemd.services.supergfxd.path = [
    pkgs.pciutils
    pkgs.kmod
  ];

}
