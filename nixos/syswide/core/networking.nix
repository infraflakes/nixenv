{ pkgs, ... }: {
  networking = {
    hostName = "serein";
    networkmanager.enable = true;
    nameservers = [
      "8.8.8.8"
      "1.1.1.1"
    ];
  };
  environment.systemPackages = with pkgs; [ nmap ];

  services.tailscale.enable = true;

  # Generate key: ssh-keygen -t ed25519 -C "infraflakes@proton.me"
  # ssh-add ~/.ssh/id_ed25519
  # `cat ~/.ssh/id_ed25519.pub` then copy and make new ssh key on github

  # programs.ssh.startAgent = true;
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "prohibit-password";
      PasswordAuthentication = true;
    };
  };
  networking.firewall.allowedTCPPorts = [ 22 ];
  #Disabled systemd services
  systemd = {
    services = {
      NetworkManager-wait-online.enable = false;
      NetworkManager-dispatcher.enable = false;
    };
  };
}
