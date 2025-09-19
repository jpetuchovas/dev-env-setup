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
      builder = darwin.lib.darwinSystem {
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

    formatter = {
      aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;
      x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.nixpkgs-fmt;
    };
  };
}
