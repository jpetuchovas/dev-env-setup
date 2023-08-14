{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, darwin, nixpkgs, home-manager }: {
    darwinConfigurations = {
      Justinass-MacBook-Pro-3 = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          ./hosts/builder
          home-manager.darwinModules.home-manager
        ];
      };

      LT-QL0WRWJ26R = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./hosts/engineer
          home-manager.darwinModules.home-manager
        ];
      };
    };

    nixosConfigurations = {
      nixos-vm-aarch64 = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = {
          hostName = "nixos-vm-aarch64";
        };
        modules = [
          ./hosts/pheonix
          home-manager.nixosModules.home-manager
        ];
      };
    };

    formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;
  };
}
