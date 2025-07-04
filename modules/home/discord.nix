{pkgs, ...}: {
  home = {
    file = {
      ".config/BetterDiscord/plugins/LaTeX.plugin.js".text = builtins.readFile (pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/BinaryQuantumSoul/discord-latex/refs/heads/main/dist/LaTeX.plugin.js";
        hash = "sha256-KMznYwfxutSYgJgmS6mVhbYFOLypXh+Hmj/ziudM71U=";
      });
      ".config/BetterDiscord/themes/nightcordmini.theme.css".text = builtins.readFile (pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/dabluee/discord-themes/refs/heads/main/prsk/nightcordmini.theme.css";
        hash = "sha256-9QuC9YEePSTC0SEzZUf+lYLa9js+E0w7m4PtTJ4OWJI=";
      });
    };
    packages = [
      pkgs.betterdiscordctl
      pkgs.discord
    ];
  };
}
