{
  programs.kitty = {
    enable = true;
    environment.NIXPKGS_ALLOW_UNFREE = "1";
    settings = {
      confirm_os_window_close = 0;
      window_padding_width = 12;
    };
  };
}
