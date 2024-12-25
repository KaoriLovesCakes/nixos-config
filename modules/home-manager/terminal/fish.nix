{
  programs.fish = {
    enable = true;
    functions.y = ''
      set tmp (mktemp -t "yazi-cwd.XXXXXX")
      yazi $argv --cwd-file="$tmp"
      if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
      	builtin cd -- "$cwd"
      end
      rm -f -- "$tmp"
    '';
    interactiveShellInit = ''
      fish_config prompt choose informative_vcs
      fish_hybrid_key_bindings
      set fish_greeting
    '';
    #   if test -z (ssh-add -l | grep -o "~/.ssh/id_ed25519")
    #       echo "SSH key has not been added into ssh-agent."
    #       ssh-add ~/.ssh/id_ed25519
    #       systemctl --user restart git-sync-notes
    #   end
    # '';
    #   if not set -q tmux
    #     exec tmux
    #   end
    # '';
  };
}
