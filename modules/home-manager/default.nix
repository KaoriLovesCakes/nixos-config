{pkgs, ...}: {
  imports = [
    ./nixvim
    ./betterdiscord.nix
    ./desktop-environment.nix
    ./direnv.nix
    ./git.nix
    ./polybar.nix
    ./qbittorrent.nix
    ./rofi.nix
    ./rclone.nix
    ./spicetify.nix
    ./terminal.nix
    ./touchegg.nix
    ./vscodium.nix
  ];

  home.packages = [
    pkgs.anki-bin
    pkgs.libreoffice-qt
    pkgs.mpv
    pkgs.obs-studio

    pkgs.cachix
    pkgs.devenv
    pkgs.fd
    pkgs.ffmpeg
    pkgs.hyfetch
    pkgs.pandoc
    pkgs.texliveFull
    pkgs.typst
    pkgs.unp
    pkgs.xclip
  ];
  programs.home-manager.enable = true;
  xsession.numlock.enable = true;
}
