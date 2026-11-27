{
  inputs = { };
  outputs =
    { self, ... }:
    let
      inputs = import ./.tack;
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
    in
    with inputs;
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };
          modules = [ ./nixos/nixos.nix ];
        };
        server = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };
          modules = [ ./nixos/server.nix ];
        };
      };
      # Home Manager
      homeConfigurations = {
        "infraflakes@nixos" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./home/nixos.nix ];
        };
        "nixuris@server" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./home/server.nix ];
        };
        "nixenv@container" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./home/container.nix ];
        };
        "infraflakes@desktop" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./home/desktop.nix ];
        };
      };
    };
}
