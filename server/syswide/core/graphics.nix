{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libva-utils # Includes 'vainfo' to test if this is working
  ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver # For Intel VA-API
      libvdpau-va-gl # VDPAU-to-VA-API translation for Intel
    ];
  };
  environment.variables = {
    LIBVA_DRIVER_NAME = "iHD";
    # LIBVA_DRIVER_NAME = "i965";
  };
}
