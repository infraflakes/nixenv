{
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
      devShells.${system} = {
        go = import ./devshells/go.nix { inherit pkgs; };
        js = import ./devshells/js.nix { inherit pkgs; };
        py = import ./devshells/py.nix { inherit pkgs; };
        c = import ./devshells/c.nix { inherit pkgs; };
      };
      homeConfigurations = {
        "nixenv@container" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./container/home.nix ];
        };
        "nixuris@desktop" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./desktop/home.nix ];
        };
      };
    };
}
