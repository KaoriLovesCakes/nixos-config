{
  imports = [
    ./desktop-environment
    ./disk
    ./networking
    ./nixvim
    ./terminal

    ./betterdiscord.nix
    ./direnv.nix
    ./fzf.nix
    ./git.nix
    ./mimeapps.nix
    ./polybar.nix
    ./qbittorrent.nix
    ./rofi.nix
    ./rclone.nix
    ./spicetify.nix
    ./vscodium.nix
  ];

  programs.home-manager.enable = true;
}
