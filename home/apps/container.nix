{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    podman
    distrobox
  ];
  home.file.".config/containers/policy.json".text = ''
    {
      "default": [{ "type": "insecureAcceptAnything" }]
    }
  '';
}
