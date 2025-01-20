{
  programs.fish = {
    enable = true;
    functions = {
      rclone-mount-all = ''
        for remote in (rclone listremotes)
          set remote_name (echo $remote | sed "s/://g")
          mkdir -p ~/"$remote_name"
          nm-online --timeout=86400
          rclone --vfs-cache-mode full mount "$remote" ~/"$remote_name" > /dev/null 2>&1 &
        end
      '';
      y = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        	builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
      '';
    };
    interactiveShellInit = ''
      fish_config prompt choose informative_vcs
      set fish_greeting
    '';
    #   if not set -q tmux
    #     exec tmux
    #   end
    # '';
  };
}
