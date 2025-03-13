{globals, ...}: {
  imports = [
    ./cloudflare-warp.nix
    ./ssh.nix
    ./tailscale.nix
  ];

  networking = {
    hostName = globals.hostname;
    networkmanager = {
      enable = true;
      insertNameservers = ["8.8.8.8" "8.8.4.4"];
    };
  };
}
