{
  programs.fish = {
    enable = true;
    functions.nixos-update-rebuild = ''
      argparse 'flake=' 'help' -- $argv

      if set -q _flag_help
        echo "usage: nixos-update-rebuild [--flake <flake-url>] [--help]"
        echo "    --flake <flake-url>: the flake to operate on. default is the current directory."
        echo "    --help             : show usage information."
        return 0
      end

      if set -q _flag_flake
        set flake_url $_flag_flake
      else
        set flake_url "."
      end

      sudo sh -c "nix flake update --flake $flake_url; nixos-rebuild switch --flake $flake_url --option eval-cache false"
    '';
    interactiveShellInit = ''
      fish_config prompt choose informative_vcs
      fish_hybrid_key_bindings
      set fish_greeting
    '';
    #   if not set -q tmux
    #     exec tmux
    #   end
    # '';
  };
}
