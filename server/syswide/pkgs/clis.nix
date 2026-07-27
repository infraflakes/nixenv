{ pkgs, inputs, ... }: {
  environment.systemPackages = [
    inputs.sutils.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.wget
    pkgs.nmap
    pkgs.fd
    pkgs.fzf
    pkgs.ripgrep
  ];
}
