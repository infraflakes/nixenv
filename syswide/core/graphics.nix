{
  config,
  pkgs,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];
  boot.kernelParams = ["nvidia.NVreg_PreserveVideoMemoryAllocations=0"];
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libglvnd
        nvidia-vaapi-driver
      ];
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = true;
      modesetting.enable = true;
    };
  };
}
