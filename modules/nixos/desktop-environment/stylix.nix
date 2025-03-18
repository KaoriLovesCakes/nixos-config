{
  globals,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${globals.base16Scheme}.yaml";
    cursor = {
      name = "Breeze";
      package = pkgs.kdePackages.breeze-icons;
      # package = pkgs.runCommand "moveUp" {} ''
      #   mkdir -p $out/share/icons
      #   ln -s ${pkgs.fetchzip {
      #     url = "https://download.kde.org/unstable/plasma/6.2.91/breeze-6.2.91.tar.xz";
      #     hash = "sha256-ar/t+Ujb7p5/huP7+YvuAHZE/ZrXQcbJ6yaARjiYFHA=";
      #   }}/cursors/Breeze/Breeze $out/share/icons/Breeze
      # '';
      size = 24;
    };
    fonts = {
      sizes = {
        desktop = 11;
        popups = 11;
      };
      serif = {
        package = pkgs.noto-fonts-cjk-serif;
        name = "Noto Serif CJK JP";
      };
      sansSerif = {
        package = pkgs.noto-fonts-cjk-sans;
        name = "Noto Sans CJK JP";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMonoNL Nerd Font";
      };
    };
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/linuxdotexe/nordic-wallpapers/refs/heads/master/wallpapers/ign_astronaut.png";
      hash = "sha256-0KP2RCkeNTYe3sf/xArmAJEcC1DF/yQJ0hIW/uR4i4Y=";
    };
    opacity.terminal = 0.7;
    polarity = "dark";
    targets = {
      grub.enable = false;
      nixvim.enable = false;
      spicetify.enable = false;
    };
  };
}
