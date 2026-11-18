{
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    #scrcpy
    #qtscrcpy
    mangohud
    lutris
    # xwayland-satellite
  ];
  # programs.gamescope.enable = true;

  #virtualisation.waydroid.enable = true;

  # Add following string to launch arg if game fails to recognize nvidia
  # VK_ICD_FILENAMES=/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json:run/opengl-driver-32/share/vulkan/icd.d/nvidia_icd.i686.json
  programs.steam = {
    enable = false;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    #gamescopeSession.enable = true;
  };
}
