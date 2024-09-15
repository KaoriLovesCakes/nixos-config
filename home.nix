{global, ...}: {
  imports = [./modules/home-manager];

  home = {
    homeDirectory = "/home/${global.username}";
    inherit (global) username;
    stateVersion = "24.11";
  };
}
