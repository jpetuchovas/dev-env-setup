{ pkgs, user, ... }:

{
  imports = [
    ../../common/darwin
  ];
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.defaults.dock.persistent-apps = [
    {
      app = "/Applications/Ghostty.app";
    }
    {
      app = "/Users/${user}/Applications/IntelliJ IDEA.app";
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
    {
      app = "/Applications/Slack.app";
    }
  ];
  home-manager.users.${user}.home.packages = import ./packages.nix { inherit pkgs; };

  homebrew = {
    brews = import ./brews.nix;
    casks = import ./casks.nix;
  };
}
