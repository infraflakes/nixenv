{
  pkgs,
  ...
}:
{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.swtpm.enable = true;
    };
    spiceUSBRedirection.enable = true;
  };
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  environment.systemPackages = with pkgs; [
    gnome-boxes
  ];
}
