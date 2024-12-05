{
  imports = [
    ./stylix.nix
    ./touchegg.nix
  ];

  programs.partition-manager.enable = true;
  services = {
    displayManager.ly.enable = true;
    xserver = {
      enable = true;
      desktopManager.plasma5.enable = true;
    };
  };
}
