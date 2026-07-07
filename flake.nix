{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      darwin,
      nixpkgs,
      home-manager,
    }:
    {
      darwinConfigurations = {

        phoenix = darwin.lib.darwinSystem {
          modules = [
            ./hosts/phoenix
            home-manager.darwinModules.home-manager
          ];
        };

        LT-JVX017WWY0 = darwin.lib.darwinSystem {
          modules = [
            ./hosts/engineer
            home-manager.darwinModules.home-manager
          ];
        };
      };

      formatter = {
        aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt-tree;
        x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.nixfmt-tree;
      };
    };
}
