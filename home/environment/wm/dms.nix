{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.dms.homeModules.dank-material-shell
  ];
  programs.dank-material-shell = {
    enable = true;
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
  };
  #services.cliphist.enable = true;
}
