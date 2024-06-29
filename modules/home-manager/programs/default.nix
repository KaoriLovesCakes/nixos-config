{
  programs = {
    firefox.enable = true;
    home-manager.enable = true;
    kitty = {
      enable = true;
      settings.confirm_os_window_close = 0;
      shellIntegration.enableFishIntegration = true;
    };
  };
}
