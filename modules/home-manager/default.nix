{pkgs, ...}: {
  imports = [
    ./desktop-environment-et-al.nix
    ./nixvim
    ./firefox.nix
    ./fish.nix
    ./git.nix
    ./kitty.nix
    ./polybar.nix
    ./qbittorrent.nix
    ./touchegg.nix
    ./vscode.nix
  ];

  home.packages = [
    pkgs.anki-bin
    pkgs.discord
    pkgs.mpv
    pkgs.obs-studio
    pkgs.osu-lazer-bin
    pkgs.typst

    pkgs.bluez
    pkgs.devenv
    # pkgs.fd
    pkgs.ffmpeg
    pkgs.hyfetch
    # pkgs.ripgrep
    pkgs.unzip
    pkgs.wget
    pkgs.xclip
    pkgs.zip
  ];

  programs.home-manager.enable = true;

  xsession.numlock.enable = true;
}
