{ pkgs, ... }: {
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  #Bootloader
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      limine.enable = true;
    };
  };

  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  time.timeZone = "Asia/Ho_Chi_Minh";
  services.timesyncd.enable = true;
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

  console = {
    font = "ter-i32b";
    packages = with pkgs; [ terminus_font ];
  };
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # Add any missing shared libraries your binary needs here, e.g.:
      # stdenv.cc.cc
      # zlib
      # openssl
    ];
  };
}
