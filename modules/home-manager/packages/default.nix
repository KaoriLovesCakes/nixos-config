{pkgs, ...}: {
  imports = [./jeezyvim.nix];

  home.packages = [
    # Applications.
    pkgs.anki-bin
    pkgs.discord
    pkgs.obs-studio
    pkgs.osu-lazer-bin
    pkgs.mpv
    pkgs.qbittorrent
    pkgs.transmission_4
    pkgs.vscodium-fhs

    # Miscellaneous.
    pkgs.bluez
    pkgs.devenv
    pkgs.fd
    pkgs.file
    pkgs.hyfetch
    pkgs.libsForQt5.bismuth
    pkgs.ripgrep
    pkgs.unzip
    pkgs.wget
    pkgs.xclip
    pkgs.zip
  ];
}
