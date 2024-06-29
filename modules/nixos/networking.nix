{
  networking = {
    hostName = "bqn-nixos";
    networkmanager.enable = true;
  };
  services.tailscale.enable = true;
}
