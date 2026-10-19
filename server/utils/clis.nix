{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    fastfetch
    fd
    fzf
    ripgrep
  ];
}
