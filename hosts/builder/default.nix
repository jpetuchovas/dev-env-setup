{ pkgs, user, ... }:

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
  home-manager.users.${user}.home.packages = import ./packages.nix { inherit pkgs; };

  homebrew = {
    casks = import ./casks.nix;
  };
}
