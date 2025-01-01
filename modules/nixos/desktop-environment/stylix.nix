{
  globals,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/linuxdotexe/nordic-wallpapers/refs/heads/master/wallpapers/ign_astronaut.png";
      hash = "sha256-0KP2RCkeNTYe3sf/xArmAJEcC1DF/yQJ0hIW/uR4i4Y=";
    };
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${globals.base16-scheme}.yaml";
    fonts = {
      sizes = {
        applications = 10;
        terminal = 11;
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMonoNL Nerd Font";
      };
    };
    cursor = {
      name = "Breeze";
      package = pkgs.runCommand "moveUp" {} ''
        mkdir -p $out/share/icons
        ln -s ${pkgs.fetchzip {
          url = "https://download.kde.org/unstable/plasma/5.93.0/breeze-5.93.0.tar.xz";
          hash = "sha256-Vela7hYBE3ub00hI52RpvrrFCTSYVWmGzzxFoux3MNQ=";
        }}/cursors/Breeze/Breeze $out/share/icons/Breeze
      '';
      size = 24;
    };
    opacity.terminal = 0.5;
    targets = {
      grub.enable = false;
      nixvim.enable = false;
      spicetify.enable = false;
    };
  };
}
