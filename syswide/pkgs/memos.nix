{
  config,
  pkgs,
  username,
  ...
}: {
  # doas zfs create iris_pool/memos
  # doas zfs set mountpoint=legacy iris_pool/memos
  # doas zfs set xattr=sa iris_pool/memos
  # Matches ZFS block size closer to SQLite page size
  # doas zfs set recordsize=64k iris_pool/memos

  # Disables "access time" updates every time a file is read (saves massive IO)
  # doas zfs set atime=off iris_pool/memos

  # Moves extended attributes into the inode (major speed boost for Linux)
  # doas zfs set xattr=sa iris_pool/memos
  # doas zfs set com.sun:auto-snapshot=true iris_pool/memos

  fileSystems."/data/memos" = {
    device = "iris_pool/memos";
    fsType = "zfs";
    options = ["nofail"];
    depends = ["/data"];
  };
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
