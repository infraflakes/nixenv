{pkgs, ...}: {
  console = {
    font = "ter-i32b";
    packages = with pkgs; [terminus_font];
  };
  #Disabled systemd services
  systemd = {
    services = {
      NetworkManager-wait-online.enable = false;
      NetworkManager-dispatcher.enable = false;
    };
  };
}
