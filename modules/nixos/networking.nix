{global, ...}: {
  networking = {
    hostName = global.hostname;
    networkmanager.enable = true;
  };
  services.tailscale.enable = true;
}
