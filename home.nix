{global, ...}: {
  imports = [./modules/home-manager];

  home = {
    homeDirectory = "/home/${global.username}";
    inherit (global) username;
    sessionVariables.NIXPKGS_ALLOW_UNFREE = 1;
    stateVersion = "24.11";
  };
}
