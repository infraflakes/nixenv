{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
  ];
  services = {
    xserver = {
      enable = true;
      desktopManager.cinnamon.enable = true;
    };
    cinnamon.apps.enable = true;
  };
}
