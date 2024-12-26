{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.anki-bin
    pkgs.caprine
    pkgs.libreoffice-qt
    pkgs.mpv
    pkgs.obs-studio
    pkgs.obsidian
    pkgs.qbittorrent
    # pkgs.zen-browser

    pkgs.cachix
    pkgs.devenv
    pkgs.fastfetch
    pkgs.fd
    pkgs.ffmpeg
    pkgs.hyfetch
    pkgs.nix-tree
    pkgs.rclone
    pkgs.ripgrep
    pkgs.tdf
    pkgs.texliveFull
    pkgs.typst
    pkgs.unzip
    pkgs.wl-clipboard
    pkgs.zip
  ];
}
