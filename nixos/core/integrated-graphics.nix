{
  config,
  pkgs,
  ...
}:
{
  services.xserver.videoDrivers = [ "modesetting" ];
  environment.variables = {
    # LIBVA_DRIVER_NAME = "iHD";
    LIBVA_DRIVER_NAME = "i965";
  };
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libglvnd
        intel-media-driver # For Intel VA-API
        libvdpau-va-gl # VDPAU-to-VA-API translation for Intel
      ];
    };
  };
}
