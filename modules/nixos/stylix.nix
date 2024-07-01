{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    image = /home/${outputs.username}/nix-config/frieren.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${outputs.theme}.yaml";

    fonts = {
      sizes = {
        applications = 10;
        terminal = 11;
      };
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMonoNL Nerd Font";
      };
    };

    cursor = let
      url = "https://download.kde.org/unstable/plasma/5.27.80/breeze-5.27.80.tar.xz";
      hash = "sha256-biE4nqGIvRYj2Bph1HURQCAimIQAb2Fj4KmA1pz+2xE=";
      name = "Breeze";
    in {
      size = 24;
      package = pkgs.runCommand "moveUp" {} ''
        mkdir -p $out/share/icons
        ln -s ${pkgs.fetchzip {
          inherit url;
          inherit hash;
        }}/cursors/Breeze/Breeze $out/share/icons/${name}
      '';
      inherit name;
    };

    opacity.terminal = 0.8;

    targets = {
      grub.enable = false;
      lightdm.enable = false;
    };
  };
}
