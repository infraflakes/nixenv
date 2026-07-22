{
  description = "Personal flake for FX507ZU4";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sutils = {
      url = "github:infraflakes/sutils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      sutils,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      # NixOS configuration
      nixosConfigurations.serein = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };
        modules = [
          ./syswide/host.nix
        ];
      };
      # Home Manager
      homeConfigurations."nixuris@nixos" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home/home.nix ];
      };
      # DevShells
      devShells.${system} = {
        go = import ./devshells/go.nix { inherit pkgs; };
        js = import ./devshells/js.nix { inherit pkgs; };
        py = import ./devshells/py.nix { inherit pkgs; };
        c = import ./devshells/c.nix { inherit pkgs; };
      };
    };
}
