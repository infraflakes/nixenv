{ config, pkgs, ... }: {
  environment.sessionVariables = {
    KUBECONFIG = "/etc/rancher/k3s/k3s.yaml";
  };

  services.k3s = {
    enable = true;
    role = "server";
    package = pkgs.k3s;

    extraFlags = toString [
      # Bind k3s API & node IP strictly to Tailscale interface/IP
      "--node-ip=100.86.100.108" # Tailscale IP
      "--flannel-iface=tailscale0" # Tell Flannel (pod CNI) to route traffic via Tailscale

      # Tailscale
      "--tls-san=100.86.100.108"
      "--tls-san=nix-server"
      "--tls-san=nix-server.saury-forel.ts.net"

      # Generates a kubeconfig readable by user group without needing sudo every time
      "--write-kubeconfig-mode=0644"
    ];
  };

  # Make kubectl easily available in system path
  environment.systemPackages = with pkgs; [
    kubectl
    (wrapHelm kubernetes-helm {
      plugins = with pkgs.kubernetes-helmPlugins; [
        helm-diff
      ];
    })
    helmfile
  ];
}
