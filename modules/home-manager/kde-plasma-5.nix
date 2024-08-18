{pkgs, ...}: {
  home.packages = [pkgs.libsForQt5.bismuth];

  programs.plasma = {
    enable = true;
    configFile = {
      "kded5rc"."Module-gtkconfig"."autoload" = false;
      "kdeglobals"."KDE"."SingleClick" = false;
      "kscreenlockerrc"."Daemon" = {
        "LockGrace" = 15;
        "Timeout" = 30;
      };
      "kwinrc" = {
        "Desktops" = {
          "Number" = 4;
          "Rows" = 2;
        };
        "Plugins" = {
          "bismuthEnabled" = true;
          "desktopchangeosdEnabled" = true;
        };
        "Script-bismuth" = {
          "screenGapBottom" = 12;
          "screenGapLeft" = 12;
          "screenGapRight" = 12;
          "screenGapTop" = 12;
          "tileLayoutGap" = 12;
        };
        "Script-desktopchangeosd"."PopupHideDelay" = 200;
        "Tiling"."padding" = 4;
        "Windows" = {
          "DelayFocusInterval" = 0;
          "FocusPolicy" = "FocusFollowsMouse";
        };
      };
      "kwinrulesrc" = {
        "1" = {
          "Description" = "Global";
          "minsize" = "1,1";
          "minsizerule" = 2;
          "noborder" = true;
          "noborderrule" = 2;
          "wmclass" = ".*";
          "wmclassmatch" = 3;
        };
        "General" = {
          "count" = 1;
          "rules" = 1;
        };
      };
    };
    shortcuts = {
      "bismuth"."toggle_window_floating" = "Meta+F";
      "kwin" = {
        "Switch One Desktop Down" = "Meta+J";
        "Switch One Desktop Up" = "Meta+K";
        "Switch One Desktop to the Left" = "Meta+H";
        "Switch One Desktop to the Right" = "Meta+L";
      };
    };
    workspace.clickItemTo = "select";
  };
}
