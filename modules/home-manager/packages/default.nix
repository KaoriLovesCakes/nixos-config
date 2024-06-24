{pkgs, ...}: {
  imports = [./jeezyvim.nix];

  home.packages = [
    # C++.
    # pkgs.clang
    # pkgs.clang-tools

    # Python.
    # pkgs.python3

    # Applications.
    pkgs.anki-bin
    pkgs.discord
    pkgs.obs-studio
    pkgs.osu-lazer-bin
    pkgs.mpv
    pkgs.qbittorrent
    pkgs.transmission
    pkgs.vscodium-fhs

    # Miscellaneous.
    pkgs.bluez
    pkgs.devenv
    pkgs.fd
    pkgs.file
    pkgs.git
    pkgs.hyfetch
    pkgs.libsForQt5.bismuth
    pkgs.ripgrep
    pkgs.unzip
    pkgs.wget
    pkgs.xclip
    pkgs.zip
  ];
}
