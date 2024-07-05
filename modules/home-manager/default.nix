{pkgs, ...}: {
  imports = [
    ./jeezyvim.nix
  ];

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
    pkgs.ffmpeg
    pkgs.file
    pkgs.hyfetch
    pkgs.libsForQt5.bismuth
    pkgs.ripgrep
    pkgs.unzip
    pkgs.wget
    pkgs.xclip
    pkgs.zip
  ];

  programs = {
    firefox.enable = true;
    git = {
      enable = true;
      userEmail = "self.bqnguyen@gmail.com";
      userName = "just-bqn";
    };
    home-manager.enable = true;
    kitty = {
      enable = true;
      settings.confirm_os_window_close = 0;
    };
  };
}
