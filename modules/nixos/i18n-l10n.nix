{pkgs, ...}: {
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        addons = [
          pkgs.fcitx5-bamboo
          pkgs.fcitx5-mozc
        ];
        settings.inputMethod = {
          "Groups/0" = {
            "Name" = "Default";
            "Default Layout" = "us-altgr-intl";
            "DefaultIM" = "keyboard-us-altgr-intl";
          };
          "Groups/0/Items/0" = {"Name" = "keyboard-us-altgr-intl";};
          "Groups/0/Items/1" = {"Name" = "bamboo";};
          "Groups/0/Items/2" = {"Name" = "mozc";};
        };
        waylandFrontend = true;
      };
    };
  };
  time.timeZone = "Asia/Ho_Chi_Minh";
}
