{pkgs, ...}: {
  imports = [
    ./desktop-environment
    ./disk
    ./nixvim
    ./terminal

    ./betterdiscord.nix
    ./direnv.nix
    ./flameshot.nix
    ./git.nix
    ./polybar.nix
    ./qbittorrent.nix
    ./rofi.nix
    ./rclone.nix
    ./spicetify.nix
    ./vscodium.nix
  ];

  home.packages = [
    pkgs.anki-bin
    pkgs.caprine
    pkgs.libreoffice-qt
    pkgs.mpv
    pkgs.obs-studio
    # pkgs.zen-browser

    pkgs.cachix
    pkgs.devenv
    pkgs.fd
    pkgs.ffmpeg
    pkgs.hyfetch
    pkgs.nix-tree
    pkgs.pandoc
    pkgs.texliveFull
    pkgs.typst
    pkgs.unp
    pkgs.xclip
  ];
  programs.home-manager.enable = true;
  xsession.numlock.enable = true;
}
