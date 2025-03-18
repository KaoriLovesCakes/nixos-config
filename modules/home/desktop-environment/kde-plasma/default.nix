{
  home.file.".config/kwinoutputconfig.json".source = ./kwinoutputconfig.json;

  programs.plasma = {
    enable = true;
    overrideConfig = true;

    configFile = {
      kdeglobals.General = {
        TerminalApplication = "wezterm";
        TerminalService = "wezterm.desktop";
      };
      kwinrc = {
        Effect-slide = {
          HorizontalGap = 0;
          SlideBackground = false;
          VerticalGap = 0;
        };
        Plugins.krohnkiteEnabled = true;
        Script-krohnkite = {
          screenGapBottom = 12;
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
      okularrc = {
        General = {
          LockSidebar = true;
          ShowSidebar = false;
        };
        MainWindow = {
          MenuBar = "Disabled";
          ToolBarsMovable = "Disabled";
        };
      };
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
        hiding = "autohide";
      }
    ];

    powerdevil.AC = {
      autoSuspend.action = "nothing";
      dimDisplay.enable = false;
      turnOffDisplay.idleTimeout = "never";
    };

    shortcuts = {
      ksmserver."Lock Session" = [];
      kwin = {
        "KrohnkiteFocusLeft" = "Meta+H";
        "KrohnkiteFocusDown" = "Meta+J";
        "KrohnkiteFocusUp" = "Meta+K";
        "KrohnkiteFocusRight" = "Meta+L";
        "Switch One Desktop to the Left" = "Meta+Alt+H";
        "Switch One Desktop Down" = "Meta+Alt+J";
        "Switch One Desktop Up" = "Meta+Alt+K";
        "Switch One Desktop to the Right" = "Meta+Alt+L";
        "Window One Desktop to the Left" = "Meta+Alt+Shift+H";
        "Window One Desktop Down" = "Meta+Alt+Shift+J";
        "Window One Desktop Up" = "Meta+Alt+Shift+K";
        "Window One Desktop to the Right" = "Meta+Alt+Shift+L";
      };
      "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = [];
      "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = [];
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
