{outputs, ...}: {
  imports = [./modules/home-manager];

  home = {
    homeDirectory = "/home/${outputs.username}";
    inherit (outputs) username;
    stateVersion = "24.11";
  };
}
