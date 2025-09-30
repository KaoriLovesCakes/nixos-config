{pkgs, ...}: {
  home = {
    file = {
      ".config/BetterDiscord/plugins/LaTeX.plugin.js".text = builtins.readFile (pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/BinaryQuantumSoul/discord-latex/refs/heads/main/dist/LaTeX.plugin.js";
        hash = "sha256-KMznYwfxutSYgJgmS6mVhbYFOLypXh+Hmj/ziudM71U=";
      });
      ".config/BetterDiscord/themes/nightcordmini.theme.css".text = builtins.readFile (pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/dabluee/discord-themes/refs/heads/main/prsk/nightcordmini.theme.css";
        hash = "sha256-9fO0lwM+FVuzBu8TcneucbpqSTVX+APVGCVBb7QiYTc=";
      });
      ".config/discord/settings.json".text = ''
        {
          "SKIP_HOST_UPDATE": true
        }
      '';
    };
    packages = [
      pkgs.betterdiscordctl
      pkgs.discord
    ];
  };
}
