{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.anki-bin
    pkgs.caprine
    pkgs.devenv
    pkgs.fastfetch
    pkgs.fd
    pkgs.ffmpeg
    pkgs.git
    pkgs.hyfetch
    pkgs.libreoffice-qt
    pkgs.mpv
    pkgs.nix-tree
    pkgs.obs-studio
    pkgs.obsidian
    pkgs.p7zip
    pkgs.progress
    pkgs.qbittorrent
    pkgs.rclone
    pkgs.ripgrep
    pkgs.typst
    pkgs.wl-clipboard
  ];
}
