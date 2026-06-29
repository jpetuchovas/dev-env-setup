{ pkgs, ... }:

{
  environment = {
    etc = {
      "nix/nix.conf".enable = false;
      zshrc.enable = false;
    };
    shells = [ pkgs.zsh ];
  };

  fonts.packages = import ../font-packages.nix { inherit pkgs; };

  homebrew = {
    enable = true;
    # Extract info from the App Store using the following instructions:
    # https://github.com/mas-cli/mas?tab=readme-ov-file#-app-ids
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

  networking = {
    applicationFirewall = {
      allowSignedApp = true;
      enable = true;
      enableStealthMode = true;
    };
  };

  nix.enable = false;

  nixpkgs.config = {
    allowUnfree = true;
  };

  programs = {
    bash.enable = false;
    zsh.enable = true;
  };

  services = {
    skhd.enable = true;
    yabai.enable = true;
  };

  system = {
    defaults = {
      CustomUserPreferences = {
        NSGlobalDomain = {
          NSQuitAlwaysKeepsWindows = true;
          "com.apple.sound.uiaudio.enabled" = 0;
        };
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

        NSAutomaticWindowAnimationsEnabled = false;
        NSDocumentSaveNewDocumentsToCloud = false;
        "com.apple.keyboard.fnState" = true;
        "com.apple.sound.beep.feedback" = 0;
      };

      WindowManager = {
        EnableStandardClickToShowDesktop = false;
        StandardHideWidgets = true;
      };

      controlcenter = {
        BatteryShowPercentage = true;
        Bluetooth = true;
        Sound = true;
      };

      dock = {
        autohide = true;
        launchanim = false;
        mru-spaces = false;
        persistent-others = [];
        show-recents = false;
        wvous-br-corner = 1;
      };

      finder = {
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        FXRemoveOldTrashItems = true;
        NewWindowTarget = "Home";
        ShowPathbar = true;
        _FXShowPosixPathInTitle = true;
        _FXSortFoldersFirst = true;
      };

      menuExtraClock = {
        ShowDate = 0;
      };

      screencapture = {
        show-thumbnail = false;
      };

      screensaver = {
        askForPassword = true;
        askForPasswordDelay = 0;
      };

      trackpad = {
        Clicking = true;
        FirstClickThreshold = 0;
        TrackpadTwoFingerFromRightEdgeSwipeGesture = 0;
      };

      universalaccess = {
        reduceMotion = true;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    startup = {
      chime = false;
    };

    stateVersion = 7;
  };
}
