{ pkgs, ... }:

{
  environment.etc."nix/nix.conf".enable = false;

  fonts = import ../fonts.nix pkgs;

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };
  };

  home-manager.useGlobalPkgs = true;

  nixpkgs.config.allowUnfree = true;

  programs.bash.enable = false;

  services.nix-daemon.enable = true;

  system.defaults = {
    dock = {
      autohide = true;
    };
  };
}
