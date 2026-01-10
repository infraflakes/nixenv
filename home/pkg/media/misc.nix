{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    zoom-us
    #planify
  ];
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-backgroundremoval
      obs-gstreamer
    ];
  };
}
