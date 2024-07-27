{outputs, ...}: {
  imports = [./modules/home-manager];

  home = {
    homeDirectory = "/home/${outputs.username}";
    username = outputs.username;
    stateVersion = "24.11";
  };
}
