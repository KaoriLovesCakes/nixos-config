{pkgs, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      set -x EDITOR nvim
    '';
  };
  users.defaultUserShell = pkgs.fish;
}
