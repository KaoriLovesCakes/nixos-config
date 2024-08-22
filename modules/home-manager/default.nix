{pkgs, ...}: {
  imports = [
    ./nixvim
    ./firefox.nix
    ./fish.nix
    ./git.nix
    ./kde-plasma-5.nix
    ./kitty.nix
    ./polybar.nix
    ./qbittorrent.nix
    ./touchegg.nix
    ./vscode.nix
  ];

  home.packages = [
    pkgs.anki-bin
    pkgs.discord
    pkgs.obs-studio
    pkgs.osu-lazer-bin
    pkgs.mpv
    pkgs.quickemu
    pkgs.vlc

    pkgs.bluez
    pkgs.devenv
    pkgs.fd
    pkgs.ffmpeg
    pkgs.file
    pkgs.hyfetch
    pkgs.ripgrep
    pkgs.unzip
    pkgs.wget
    pkgs.xclip
    pkgs.zip
  ];

  programs.home-manager.enable = true;

  xsession.numlock.enable = true;
}
