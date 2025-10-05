{globals, ...}: {
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "daily";
      extraArgs = "--keep-since 3d";
    };
    flake = "/home/${globals.username}/Repositories/${globals.hostname}";
  };
}
