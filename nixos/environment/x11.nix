{ pkgs, inputs, ... }:
{
  imports = [
    inputs.xlibre-overlay.nixosModules.overlay-xlibre-xserver
    inputs.xlibre-overlay.nixosModules.overlay-all-xlibre-drivers
    inputs.xlibre-overlay.nixosModules.nvidia-ignore-ABI
  ];
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
  };
  services.libinput = {
    enable = true;
    touchpad = {
      naturalScrolling = true;
      tapping = true;
    };
  };

  environment.systemPackages = with pkgs; [
    xauth
    xrandr
    arandr
    maim
    xclip
    xset
    xsetroot
    feh
  ];
  programs.slock.enable = true;
}
