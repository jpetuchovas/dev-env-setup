{ pkgs, ... }:

{
  environment = {
    etc = {
      "nix/nix.conf".enable = false;
      zshrc.enable = false;
    };
    shells = [ pkgs.zsh ];
    # Include man search paths missing from Nix-installed man and available by
    # default on macOS. Compare:
    # ~/.nix-profile/bin/manpath
    # with
    # /usr/bin/manpath
    variables = {
      MANPATH = ":/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/share/man:/Library/Developer/CommandLineTools/usr/share/man";
    };
  };

  fonts.packages = import ../font-packages.nix { inherit pkgs; };

  homebrew = {
    enable = true;
    # mas list
    # OR
    # Extract infro from the App Store using the following instructions:
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
    taps = [
      "homebrew/services"
    ];
  };

  home-manager.useGlobalPkgs = true;

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
        "com.apple.finder" = {
          FXRemoveOldTrashItems = true;
          _FXSortFoldersFirst = true;
        };
        "com.apple.screencapture".show-thumbnail = false;
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
      };

      alf = {
        allowdownloadsignedenabled = 1;
        globalstate = 1;
        stealthenabled = 1;
      };

      dock = {
        autohide = true;
        launchanim = false;
        mru-spaces = false;
        show-recents = false;
        wvous-br-corner = 1;
      };

      finder = {
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        ShowPathbar = true;
        _FXShowPosixPathInTitle = true;
      };

      menuExtraClock = {
        ShowDate = 0;
      };

      trackpad = {
        Clicking = true;
        FirstClickThreshold = 0;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    stateVersion = 5;
  };
}
