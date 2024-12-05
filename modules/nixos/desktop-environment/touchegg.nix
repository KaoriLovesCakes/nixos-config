{pkgs, ...}: {
  environment.systemPackages = [pkgs.touchegg];
  services.touchegg.enable = true;
}
