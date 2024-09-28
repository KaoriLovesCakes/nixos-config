{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g allow-passthrough on
    '';
    keyMode = "vi";
    mouse = true;
  };
}
