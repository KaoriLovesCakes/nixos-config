{pkgs, ...}: {
  environment.systemPackages = [pkgs.quickemu];
  virtualisation.spiceUSBRedirection.enable = true;
}
