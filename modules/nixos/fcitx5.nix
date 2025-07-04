{pkgs, ...}: {
  i18n = {
    extraLocaleSettings.LC_TIME = "ja_JP.UTF-8";
    inputMethod = {
      enable = true;
      fcitx5 = {
        addons = [
          pkgs.fcitx5-bamboo
          pkgs.fcitx5-mozc
        ];
        plasma6Support = true;
        settings = {
          globalOptions = {
            "Hotkey/TriggerKeys"."0" = "";
            "Hotkey/AltTriggerKeys"."0" = "";
            # Behavior.PreeditEnabledByDefault = "False";
          };
          inputMethod = {
            "Groups/0" = {
              "Default Layout" = "us-altgr-intl";
              DefaultIM = "keyboard-us-altgr-intl";
              Name = "Default";
            };
            "Groups/0/Items/0".Name = "keyboard-us-altgr-intl";
            "Groups/0/Items/1".Name = "mozc";
            "Groups/0/Items/2".Name = "bamboo";
          };
        };
        waylandFrontend = true;
      };
      type = "fcitx5";
    };
  };
}
