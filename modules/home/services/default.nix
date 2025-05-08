{
  imports = [
    ./kanata
    ./ksshaskpass-start.nix
    ./qbittorrent-start.nix
    ./rclone-mount-all.nix
  ];

  systemd.user.startServices = "sd-switch";
}
