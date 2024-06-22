{pkgs, ...}: {
  imports = [./jeezyvim.nix];

  home.packages = [
    # C++.
    pkgs.clang
    pkgs.clang-tools

    # Python.
    pkgs.python3

    # Applications.
    pkgs.discord
    pkgs.obs-studio
    pkgs.osu-lazer-bin
    pkgs.mpv
    pkgs.qbittorrent
    pkgs.transmission
    pkgs.vscodium-fhs

    # Miscellaneous.
    pkgs.any-nix-shell
    pkgs.bluez
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
