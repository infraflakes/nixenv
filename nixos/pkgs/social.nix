{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    # zoom-us
    vesktop
    firefox
    proton-vpn
  ];
}
