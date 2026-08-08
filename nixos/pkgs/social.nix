{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # zoom-us
    firefox
    proton-vpn
    element-desktop
  ];
}
