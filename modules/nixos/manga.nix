{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.komga
    pkgs.suwayomi-server
  ];
  services = {
    komga = {
      enable = true;
      port = 25600;
    };
    suwayomi-server = {
      enable = true;
      settings.server.port = 4567;
    };
  };
}
