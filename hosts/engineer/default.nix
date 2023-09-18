{ pkgs, ... }:

let
  user = "justinasp";
  common-casks = import ../../common/darwin/casks.nix;
  additional-casks = import ./casks.nix;
  common-brews = import ../../common/darwin/brews.nix;
  additional-brews = import ./brews.nix;
in
{
  imports = [
    ../../common/darwin
  ];

  users.users.${user} = {
    home = "/Users/${user}";
    shell = pkgs.zsh;
  };

  home-manager.users.${user} = { pkgs, ... }:
    let
      common-packages = import ../../common/packages.nix { inherit pkgs; };
      additional-packages = import ./packages.nix { inherit pkgs; };
    in
    {
      imports = [
        ../../common/home-manager-users.nix
      ];

      home.packages = common-packages ++ additional-packages;
    };

  homebrew = {
    brews = common-brews ++ additional-brews;
    casks = common-casks ++ additional-casks;
  };
}
