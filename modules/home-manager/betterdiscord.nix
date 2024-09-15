{pkgs, ...}: {
  home = {
    file.".config/BetterDiscord/themes/catppuccin-mocha.theme.css".text = builtins.replaceStrings ["DM Mono"] ["JetBrainsMonoNL Nerd Font"] (
      builtins.readFile (
        builtins.fetchurl {
          url = "https://raw.githubusercontent.com/refact0r/system24/main/theme/system24.theme.css";
          sha256 = "1vrk58ms1pk7m7kmr94s19md0ha8j3p9s1dphw7dh39mx9chv5jq";
        }
      )
    );
    packages = [
      pkgs.betterdiscordctl
      pkgs.discord
    ];
  };
}
