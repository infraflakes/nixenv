{
  description = "Personal flake for servers";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    srn-coreutils = {
      url = "github:infraflakes/srn-coreutils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    scd = {
      url = "github:infraflakes/scd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    srn-coreutils,
    scd,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    username = "nixuris";
    hostname = "serein";
  in {
    # NixOS configuration
    nixosConfigurations.serein = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs username system;};
      modules = [./syswide/host.nix];
    };
  };
}
