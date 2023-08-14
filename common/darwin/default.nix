{ pkgs, ... }:

{
  environment = {
    etc = {
      "nix/nix.conf".enable = false;
      zshrc.enable = false;
    };
    shells = [ pkgs.zsh ];
  };

  fonts = {
    fontDir.enable = true;
    fonts = import ../font-packages.nix { inherit pkgs; };
  };

  homebrew = {
    enable = true;
    # mas list
    masApps = {
      Pages = 409201541;
      Keynote = 409183694;
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

  system = {
    defaults = {
      alf = {
        allowdownloadsignedenabled = 1;
        globalstate = 1;
        stealthenabled = 1;
      };

      dock = {
        autohide = true;
        launchanim = false;
        show-recents = false;
        wvous-br-corner = 1;
      };

      finder = {
        FXDefaultSearchScope = "SCcf";
        ShowPathbar = true;
        _FXShowPosixPathInTitle = true;
      };

      menuExtraClock = {
        ShowDate = 0;
      };

      NSGlobalDomain = {
        AppleScrollerPagingBehavior = true;
        AppleShowAllExtensions = true;
        AppleICUForce24HourTime = true;

        # Delay Until Repeat.
        # Values in System Preferences UI: 120, 94, 68, 35, 25, 15.
        InitialKeyRepeat = 15;
        # Values in System Preferences UI: 120, 90, 60, 30, 12, 6, 2.
        KeyRepeat = 2;

        NSDocumentSaveNewDocumentsToCloud = false;
        "com.apple.keyboard.fnState" = true;
        "com.apple.sound.beep.feedback" = 0;
      };

      trackpad = {
        Clicking = true;
        FirstClickThreshold = 0;
      };

      CustomUserPreferences = {
        "com.apple.finder" = {
          FXRemoveOldTrashItems = true;
          _FXSortFoldersFirst = true;
        };
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
