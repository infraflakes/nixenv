{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  #doas zfs create -o mountpoint=legacy iris_pool/ocis
  #doas zfs set com.sun:auto-snapshot=true iris_pool/ocis
  fileSystems."/data/ocis" = {
    device = "iris_pool/ocis";
    fsType = "zfs";
    options = ["nofail"];
    depends = ["/data"]; # Ensures the parent mount is ready first
  };
  environment = {
    systemPackages = with pkgs; [ocis];
    variables = {
      OCIS_CONFIG_DIR = "/data/ocis/config";
      OCIS_BASE_DATA_PATH = "/data/ocis/data";
    };
  };
  systemd.services.ocis = {
    description = "ownCloud Infinite Scale";
    after = ["network.target" "data-ocis.mount"];
    wantedBy = ["multi-user.target"];

    environment = {
      OCIS_CONFIG_DIR = "/data/ocis/config";
      OCIS_BASE_DATA_PATH = "/data/ocis/data";
      # OCIS_STORAGE_FRONTEND_UPLOAD_MAX_CHUNK_SIZE = "99614720"; # 95MB
      # STORAGE_USERS_DRIVER = "posix";
      PROXY_ENABLE_BASIC_AUTH = "true";
      PROXY_HTTP_ADDR = "192.168.1.19:9200";
      PROXY_TLS = "false"; # Disable the internal proxy if use Cloudflare Tunnel or Nginx
      OCIS_INSECURE = "true";
    };
    serviceConfig = {
      Type = "simple";
      User = username;
      Group = "users";
      WorkingDirectory = "/data/ocis";
      ExecStart = "${pkgs.ocis}/bin/ocis server";
      EnvironmentFile = "/data/ocis/runtime.env";
      Restart = "always";
    };
  };
}
