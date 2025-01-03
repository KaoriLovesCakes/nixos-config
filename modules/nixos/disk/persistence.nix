{
  environment.persistence."/persist/system" = {
    hideMounts = true;
    directories = [
      "/etc"
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/var/lib/tailscale"
    ];
    files = [
    ];
  };
}
