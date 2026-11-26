{ pkgs, inputs, ... }:
{
  imports = [ inputs.rex.nixosModules.default ];
  services.rex.enable = true;
}
