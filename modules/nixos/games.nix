{pkgs, ...}: {
  programs = {
    honkers-railway-launcher.enable = true;
    steam.enable = true;
  };

  services.minecraft-servers = {
    enable = true;
    eula = true;
    servers.vanilla = {
      enable = true;
      jvmOpts = "-Xmx8G -Xms8G";
      # package = pkgs.minecraftServers.vanilla-1_21;
    };
  };
}
