{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    yazi
    zip
    unzip
    p7zip
    unrar
    nautilus
    sushi
  ];
}
