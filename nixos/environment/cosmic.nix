{ pkgs, ... }: {
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  services.system76-scheduler.enable = true;
  environment.cosmic.excludePackages = with pkgs; [
    orca
    cosmic-edit
    cosmic-term
    cosmic-store
    cosmic-reader
    cosmic-player
  ];
}
