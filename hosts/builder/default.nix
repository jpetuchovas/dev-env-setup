{ pkgs, ... }:

let
  user = "justinasp";
in
{
  imports = [
    ../../common/darwin
  ];
  nixpkgs.hostPlatform = "x86_64-darwin";
  system.defaults.dock.persistent-apps = [
    {
      app = "/Applications/Ghostty.app";
    }
    {
      app = "/Applications/Obsidian.app";
    }
    {
      app = "/Users/${user}/Applications/Brave Browser Apps.localized/Google Calendar.app";
    }
    {
      app = "/Applications/Brave Browser.app";
    }
  ];
  system.primaryUser = user;

  users.users.${user} = {
    home = "/Users/${user}";
    shell = pkgs.zsh;
  };

  home-manager.users.${user} =
    { pkgs, ... }:
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
    casks = import ./casks.nix;
  };
}
