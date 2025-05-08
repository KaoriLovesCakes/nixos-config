{
  globals,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${globals.theme}.yaml";
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
    opacity.terminal = 0.95;
    polarity = "dark";
    targets = {
      grub.enable = false;
      nixvim.enable = false;
      spicetify.enable = false;
    };
  };
}
