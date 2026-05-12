{...}: {
  services.forgejo = {
    enable = true;
    stateDir = "/data/forgejo";

    database = {
      type = "postgres";
      # Automatically creates the 'forgejo' DB and user in Postgres
      createDatabase = true;
    };

    settings = {
      server = {
        DOMAIN = "nix-server";
        ROOT_URL = "http://nix-server:3000/";
        HTTP_PORT = 3000;
      };

      repository = {
        ENABLE_PUSH_CREATE_USER = true;
        DEFAULT_PUSH_CREATE_PRIVATE = true;
      };
    };
  };

  # systemd.tmpfiles.rules = [
  # "d /data/forgejo 0750 forgejo forgejo - -"
  # ];

  # Open the port in the firewall specifically for the Tailscale interface
  networking.firewall.allowedTCPPorts = [3000];
}
# 1. Create the nested path that the secret helper is complaining about
# sudo mkdir -p /data/forgejo/custom/conf
# 2. Ensure the forgejo user/group owns the entire dataset
# sudo chown -R forgejo:forgejo /data/forgejo
# 3. Set the correct permissions so the helper can write the keys
# sudo chmod -R 750 /data/forgejo

