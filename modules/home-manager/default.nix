{pkgs, ...}: {
  imports = [
    ./nixvim
    ./desktop-environment-et-al.nix
    ./betterdiscord.nix
    ./fish.nix
    ./git.nix
    ./kitty.nix
    ./polybar.nix
    ./qbittorrent.nix
    ./rofi.nix
    ./spicetify.nix
    ./tmux.nix
    ./touchegg.nix
    ./vscodium.nix
  ];

  home.packages = [
    pkgs.anki-bin
    pkgs.mpv
    pkgs.obs-studio
    pkgs.osu-lazer-bin
    pkgs.ryujinx

    pkgs.ffmpeg
    pkgs.hyfetch
    pkgs.typst
    pkgs.unp
    pkgs.xclip
  ];
  programs.home-manager.enable = true;
  xsession.numlock.enable = true;
}
