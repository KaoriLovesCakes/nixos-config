{globals, ...}: {
  home.persistence."/persist/${globals.homeDirectory}" = {
    directories = [
      ".config/BetterDiscord"
      ".config/Caprine"
      ".config/discord"
      ".config/libreoffice"
      ".config/qBittorrent"
      ".config/rclone"
      ".config/spotify"
      ".local/share/fish"
      ".local/share/honkers-railway-launcher"
      ".local/share/kwalletd"
      ".local/share/qBittorrent"
      ".local/share/Steam"
      ".ssh"
      ".steam"
      ".zen"
      "Desktop"
      "Documents"
      "Downloads"
      "Music"
      "Pictures"
      "Videos"
      "nix-config"
    ];
    files = [
      ".config/hyfetch.json"
      ".config/kwinoutputconfig.json"
      ".config/kwinrc"
      ".config/nix/nix.conf"
    ];
    allowOther = true;
  };
}
