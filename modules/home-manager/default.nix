{pkgs, ...}: {
  imports = [
    ./nixvim
    ./desktop-environment-et-al.nix
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

    pkgs.devenv
    pkgs.ffmpeg
    pkgs.hyfetch
    pkgs.typst
    pkgs.unzip
    pkgs.xclip
    pkgs.zip
  ];
  programs.home-manager.enable = true;
  xsession.numlock.enable = true;
}
