{ pkgs, inputs, ... }: {
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];
  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    packages = [
      "com.spotify.Client"
    ];
    update.onActivation = true;
  };
  environment.systemPackages = with pkgs; [
    spicetify-cli
  ];
  systemd.services.spicetify-flatpak-permissions = {
    description = "Grant user write permissions to Flatpak Spotify for Spicetify";
    wantedBy = [ "multi-user.target" ];
    after = [ "flatpak-managed-install.service" ];
    wants = [ "flatpak-managed-install.service" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      SPOTIFY_DIR="/var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify"
      if [ -d "$SPOTIFY_DIR" ]; then
        ${pkgs.coreutils}/bin/chown -R infraflakes:users "$SPOTIFY_DIR"
        ${pkgs.coreutils}/bin/chmod -R u+rwX "$SPOTIFY_DIR"
      fi
    '';
  };
}
