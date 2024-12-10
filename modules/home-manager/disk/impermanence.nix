{global, ...}: {
  home.persistence."/persist/home/${global.username}" = {
    directories = [
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
      "notes"
    ];
    files = [
      ".config/hyfetch.json"
      ".config/nix/nix.conf"
    ];
    allowOther = true;
  };
}
