{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    home-manager
    htop
    ncdu
    bottom
    lm_sensors
    bluetuith
    pulsemixer
    brightnessctl
  ];
  #Bootloader
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      limine.enable = true;
    };
  };
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  # Enable trim
  services.fstrim = {
    enable = true;
    interval = "weekly";
  };
  #ZRAM Swap
  swapDevices = [
    {
      device = "/swapfile";
      size = 16384;
    }
  ];
  boot.kernelParams = [
    "zswap.enabled=1"
    "zswap.compressor=zstd" # Best ratio for CPU
    "zswap.max_pool_percent=20" # 20% of 24GB is ~4.8GB
    "zswap.zpool=zsmalloc" # More efficient memory allocator
  ];
  boot.kernel.sysctl."vm.swappiness" = 60;

  #Bluetooth
  hardware.bluetooth.enable = true;
  #Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "vi_VN";
  };
  #Time zone
  time.timeZone = "Asia/Ho_Chi_Minh";
  services.timesyncd.enable = true;
  #Nix-LD
  programs.nix-ld.enable = true;
}
