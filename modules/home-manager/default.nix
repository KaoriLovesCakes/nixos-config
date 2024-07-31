{pkgs, ...}: {
  imports = [
    ./jeezyvim.nix
    ./kde-plasma-5.nix
    ./touchegg.nix
    ./vscode.nix
  ];

  home.packages = [
    pkgs.anki-bin
    pkgs.discord
    pkgs.obs-studio
    pkgs.osu-lazer-bin
    pkgs.mpv
    pkgs.qbittorrent
    pkgs.quickemu
    pkgs.transmission_4

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
    direnv = {
      enable = true;
      silent = true;
    };
    firefox = {
      enable = true;
      nativeMessagingHosts = [pkgs.tridactyl-native];
    };
    fish = {
      enable = true;
      interactiveShellInit = ''
        fish_config prompt choose informative_vcs
        set fish_greeting
      '';
    };
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

  xsession.numlock.enable = true;
}
