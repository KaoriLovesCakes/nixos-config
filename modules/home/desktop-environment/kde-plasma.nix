{config, ...}: {
  home.file.".config/kwinoutputconfig.json".source = config.lib.file.mkOutOfStoreSymlink ../symlinks/.config/kwinoutputconfig.json;

  programs.plasma = {
    enable = true;
    overrideConfig = true;

    configFile = {
      kwinrc = {
        Effect-slide = {
          HorizontalGap = 0;
          SlideBackground = false;
          VerticalGap = 0;
        };
        Plugins.krohnkiteEnabled = true;
        Script-krohnkite = {
          screenGapBottom = 24;
          screenGapLeft = 12;
          screenGapRight = 12;
          screenGapTop = 12;
          tileLayoutGap = 12;
        };
        Wayland.InputMethod = "/run/current-system/sw/share/applications/org.fcitx.Fcitx5.desktop";
        Windows = {
          DelayFocusInterval = 0;
          FocusPolicy = "FocusFollowsMouse";
        };
        Xwayland.Scale = 1;
      };
      plasmashellrc."PlasmaViews/Panel 2/Defaults".thickness = 36;
    };

    hotkeys.commands.rofimoji = {
      name = "Launch rofimoji";
      key = "Meta+R";
      command = ''rofi -modi "emoji:rofimoji" -show'';
    };

    input.keyboard.numlockOnStartup = "on";
    kscreenlocker.autoLock = false;

    kwin = {
      effects.desktopSwitching.animation = "slide";
      tiling.padding = 4;
      virtualDesktops = {
        number = 4;
        rows = 2;
      };
    };

    panels = [
      {
        floating = true;
      }
    ];

    powerdevil.AC = {
      autoSuspend.action = "nothing";
      dimDisplay.enable = false;
      turnOffDisplay.idleTimeout = "never";
    };

    shortcuts = {
      ksmserver."Lock Session" = ["Meta+Shift+L"];
      kwin = {
        "Switch One Desktop Down" = "Meta+J";
        "Switch One Desktop Up" = "Meta+K";
        "Switch One Desktop to the Left" = "Meta+H";
        "Switch One Desktop to the Right" = "Meta+L";
        "Window One Desktop Down" = "Meta+Ctrl+Shift+J";
        "Window One Desktop Up" = "Meta+Ctrl+Shift+K";
        "Window One Desktop to the Left" = "Meta+Ctrl+Shift+H";
        "Window One Desktop to the Right" = "Meta+Ctrl+Shift+L";
      };
    };

    window-rules = [
      {
        description = "Global";
        match = {
          window-class = {
            value = ".*";
            type = "regex";
          };
        };
        apply = {
          minsize = {
            value = "1,1";
            apply = "force";
          };
          noborder = {
            value = true;
            apply = "force";
          };
        };
      }
    ];

    workspace.clickItemTo = "select";
  };
}
