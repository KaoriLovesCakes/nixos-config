{pkgs, ...}: {
  environment.systemPackages = [pkgs.quickemu];
  services.usbmuxd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
