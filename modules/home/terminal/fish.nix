{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    #   if not set -q tmux
    #     exec tmux
    #   end
    # '';
  };
}
