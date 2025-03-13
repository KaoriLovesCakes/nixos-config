{
  programs.fish = {
    enable = true;
    # functions.y = ''
    #   set tmp (mktemp -t "yazi-cwd.XXXXXX")
    #   yazi $argv --cwd-file="$tmp"
    #   if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
    #   	builtin cd -- "$cwd"
    #   end
    #   rm -f -- "$tmp"
    # '';
    interactiveShellInit = ''
      fish_config prompt choose informative
      set __fish_git_prompt_char_cleanstate \uf00c
      set __fish_git_prompt_char_dirtystate \uf067
      set __fish_git_prompt_char_invalidstate \uf00d
      set __fish_git_prompt_char_stagedstate \uf111
      set __fish_git_prompt_char_stashstate \uf024
      set __fish_git_prompt_char_untrackedfiles \uf141
      set __fish_git_prompt_char_upstream_ahead \uf062
      set __fish_git_prompt_char_upstream_behind \uf063
      set fish_greeting
    '';
    #   if not set -q tmux
    #     exec tmux
    #   end
    # '';
  };
}
