{outputs, ...}: {
  networking = {
    hostName = outputs.hostname;
    networkmanager.enable = true;
  };
  services.tailscale.enable = true;
}
