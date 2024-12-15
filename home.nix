{globals, ...}: {
  imports = [./modules/home-manager];

  home = {
    inherit (globals) username;
    sessionVariables.NIXPKGS_ALLOW_UNFREE = 1;
    stateVersion = "24.11";
  };
}
