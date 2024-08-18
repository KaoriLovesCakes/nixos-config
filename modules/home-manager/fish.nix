{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      fish_config prompt choose informative_vcs
      set fish_greeting
    '';
  };
}
