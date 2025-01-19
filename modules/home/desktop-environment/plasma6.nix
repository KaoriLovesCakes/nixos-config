{
  programs.plasma = {
    enable = true;

    configFile = {
      kwinrc = {
        Effect-slide = {
          HorizontalGap = 0;
          SlideBackground = false;
          VerticalGap = 0;
        };
        Script-krohnkite = {
          screenGapBottom = 12;
          screenGapLeft = 12;
          screenGapRight = 12;
          screenGapTop = 12;
          tileLayoutGap = 12;
        };
        Plugins.krohnkiteEnabled = true;
        Windows = {
          DelayFocusInterval = 0;
          FocusPolicy = "FocusFollowsMouse";
        };
        Wayland.InputMethod = "/run/current-system/sw/share/applications/org.fcitx.Fcitx5.desktop";
      };
      plasmashellrc."PlasmaViews/Panel 2".panelVisibility = 1;
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

    powerdevil.AC = {
      autoSuspend.action = "nothing";
      dimDisplay.enable = false;
      turnOffDisplay.idleTimeout = "never";
    };

    startup.startupScript = {
      qBittorrent.text = "qbittorrent";
      ksshaskpass.text = ''
        SSH_ASKPASS=ksshaskpass ssh-add < /dev/null
        ssh-add ~/.ssh/id_ed25519
        systemctl --user restart git-sync-notes
      '';
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

    hotkeys.commands.rofimoji = {
      name = "Launch rofimoji";
      key = "Meta+R";
      command = ''rofi -modi "emoji:rofimoji" -show'';
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

    workspace.clickItemTo = "select";
  };
}
