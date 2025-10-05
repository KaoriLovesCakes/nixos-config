{pkgs, ...}: {
  home.packages = [
    # GUI
    pkgs.anki-bin
    pkgs.caprine
    pkgs.devenv
    pkgs.libreoffice-qt
    pkgs.mpv
    pkgs.obs-studio
    pkgs.osu-lazer-bin
    # pkgs.prismlauncher
    pkgs.qbittorrent

    # CLI
    pkgs.blahaj
    pkgs.fastfetch
    pkgs.fd
    pkgs.hyfetch
    pkgs.nix-output-monitor
    pkgs.nix-tree
    # pkgs.ollama
    pkgs.p7zip
    pkgs.progress
    pkgs.rclone
    pkgs.ripgrep
    pkgs.unp
    pkgs.unrar-wrapper
    pkgs.wl-clipboard

    # pkgs.vscode
  ];
}
