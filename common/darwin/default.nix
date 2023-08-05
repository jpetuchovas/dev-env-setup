{ pkgs, ... }:

{
  environment = {
    etc = {
      "nix/nix.conf".enable = false;
      zshrc.enable = false;
    };
    shells = [ pkgs.zsh ];
  };

  fonts = import ../fonts.nix pkgs;

  homebrew = {
    enable = true;
    # mas list
    masApps = {
      Pages = 409201541;
      Keynote =  409183694;
      Numbers = 409203825;
    };
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
  };

  home-manager.useGlobalPkgs = true;

  nixpkgs.config.allowUnfree = true;

  programs = {
    bash.enable = false;
    zsh.enable = true;
  };

  services.nix-daemon.enable = true;

  system.defaults = {
    dock = {
      autohide = true;
    };
  };
}
