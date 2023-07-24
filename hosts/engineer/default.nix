{ ... }:

let
  user = "justinasp";
  common-casks = import ../../common/darwin/casks.nix;
  additional-casks = import ./casks.nix;
in {
  imports = [
    ../../common/darwin
  ];

  users.users.${user}.home = /Users/${user};

  home-manager.users.${user} = { pkgs, ... }: {
    imports = [
      ../../common/home-manager-users.nix
    ];

    home.packages = import ../../common/packages.nix { inherit pkgs; };
  };

  homebrew.casks = common-casks ++ additional-casks;
}
