{
  config,
  pkgs,
  username,
  ...
}: {
  # Ensure memos is available
  environment.systemPackages = [pkgs.memos];

  systemd.services.memos = {
    description = "Memos Service";

    after = ["network.target" "data-memos.mount"];
    requires = ["data-memos.mount"];

    wantedBy = ["multi-user.target"];

    serviceConfig = {
      Type = "simple";
      User = username;
      Group = "users";

      # Memos uses this dir for its SQLite DB and assets
      Environment = "MEMOS_DATA=/data/memos";

      # Default port is 5230
      ExecStart = "${pkgs.memos}/bin/memos --mode prod --port 5230";

      WorkingDirectory = "/data/memos";
      Restart = "always";
    };
  };
}
