{pkgs, ...}: {
  environment.systemPackages = [pkgs.kdePackages.krohnkite];
  programs.partition-manager.enable = true;
  services = {
    xserver.enable = true;
    desktopManager.plasma6.enable = true;
  };
}
