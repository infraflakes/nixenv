{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [ocis];
  environment = {
    # Disable the internal proxy if use Cloudflare Tunnel or Nginx
    PROXY_TLS = "false";
  };
  systemd.services.ocis = {
    description = "oCIS Server";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.ocis}/bin/ocis server";
      # Point to a mutable file on data drive
      EnvironmentFile = "/mnt/data/ocis/runtime.env";
      WorkingDirectory = "/mnt/data/ocis";
      Restart = "always";
    };
  };
}
