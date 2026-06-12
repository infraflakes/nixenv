{
  pkgs,
  username,
  ...
}: {
  # sudo zfs create -o mountpoint=legacy iris_pool/ocis
  # sudo zfs set com.sun:auto-snapshot=true iris_pool/ocis
  # sudo chown -R $USER:users /data/ocis
  # OCIS_CONFIG_DIR=/data/ocis/config ocis init
  # OCIS_CONFIG_DIR=/data/ocis/config ocis idm resetpassword
  fileSystems."/data/ocis" = {
    device = "iris_pool/ocis";
    fsType = "zfs";
    options = ["nofail"];
    depends = ["/data"];
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
      OCIS_URL = "https://nix-server:9200"; # url must be https
      OCIS_INSECURE = "true";
      PROXY_ENABLE_BASIC_AUTH = "true";
      NOTIFICATIONS_SMTP_SENDER = "admin@localhost"; #dummy for compliance
      PROXY_HTTP_ADDR = ":9200";
    };
    serviceConfig = {
      Type = "simple";
      User = username;
      Group = "users";
      WorkingDirectory = "/data/ocis";
      ExecStart = "${pkgs.ocis}/bin/ocis server";
      Restart = "always";
    };
  };
}
