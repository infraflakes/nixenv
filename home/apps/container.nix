{
  config,
  pkgs,
  ...
}: {
  services.podman = {
    enable = false;
    settings.registries.search = [
      "docker.io"
      "quay.io"
      "registry.fedoraproject.org"
      "mirror.gcr.io"
    ];
  };
}
