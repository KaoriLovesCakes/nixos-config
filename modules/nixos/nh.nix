{globals, ...}: {
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "daily";
      extraArgs = "--keep-since 3d";
    };
    flake = globals.configDirectory;
  };
}
