{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      bind -n M-S-F4 kill-session
      set -g allow-passthrough on
    '';
    keyMode = "vi";
    mouse = true;
  };
}
