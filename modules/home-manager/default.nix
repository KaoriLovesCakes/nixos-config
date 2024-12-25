{
  imports = [
    ./desktop-environment
    ./disk
    ./nixvim
    ./terminal

    ./betterdiscord.nix
    ./direnv.nix
    ./fzf.nix
    ./git.nix
    ./mimeapps.nix
    ./polybar.nix
    ./rofi.nix
    ./rclone.nix
    ./spicetify.nix
    ./vscodium.nix
    ./yazi.nix
  ];

  programs.home-manager.enable = true;
}
