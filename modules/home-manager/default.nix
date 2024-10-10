{pkgs, ...}: {
  imports = [
    ./nixvim
    ./desktop-environment.nix
    ./betterdiscord.nix
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

    pkgs.ffmpeg
    pkgs.hyfetch
    pkgs.typst
    pkgs.unp
    pkgs.xclip
  ];
  programs.home-manager.enable = true;
  xsession.numlock.enable = true;
}
