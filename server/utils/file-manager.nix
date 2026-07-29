{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    yazi
    zip
    unzip
    p7zip
    unrar
  ];
}
