{
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        fish_config prompt choose informative_vcs
        set fish_greeting
        if not set -q TMUX
          exec tmux
        end
      '';
    };
    kitty = {
      enable = true;
      environment = {
        NIXPKGS_ALLOW_UNFREE = "1";
      };
      settings = {
        confirm_os_window_close = 0;
        window_padding_width = 12;
      };
    };
    tmux = {
      enable = true;
      extraConfig = ''
        bind -n M-F4 kill-session
        bind -n M-S-F4 kill-window
        set -g allow-passthrough on
      '';
      keyMode = "vi";
      mouse = true;
    };
  };
}
