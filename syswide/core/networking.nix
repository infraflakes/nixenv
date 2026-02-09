{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [cloudflared];
  networking.interfaces.wlp3s0.ipv4.addresses = [
    {
      address = "192.168.1.20";
      prefixLength = 24;
    }
  ];

  # DNS
  networking = {
    hostName = "serein";
    networkmanager.enable = true;
    nameservers = ["8.8.8.8" "1.1.1.1"];
    defaultGateway = "192.168.1.1";
  };

  # SSH
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "prohibit-password";
      PasswordAuthentication = true;
    };
  };
  networking.firewall.allowedTCPPorts = [22];
}
