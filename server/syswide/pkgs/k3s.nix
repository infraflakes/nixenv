{ config, pkgs, ... }: {

  # Allow k3s control plane and Ingress through the firewall
  # (Tailscale interface or local if you prefer)
  networking.firewall.allowedTCPPorts = [
    80
    443
    6443
  ];

  services.k3s = {
    enable = true;
    role = "server";
    package = pkgs.k3s;

    extraFlags = toString [
      # Bind k3s API & node IP strictly to Tailscale interface/IP
      "--node-ip=100.86.100.108" # Tailscale IP
      "--flannel-iface=tailscale0" # Tell Flannel (pod CNI) to route traffic via Tailscale

      # Generates a kubeconfig readable by user group without needing sudo every time
      "--write-kubeconfig-mode=0644"
    ];
  };

  # Make kubectl easily available in system path
  environment.systemPackages = [
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.helmfile
  ];
}
