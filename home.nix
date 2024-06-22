{
  imports = [./modules/home-manager];

  home = {
    username = "_bqn";
    homeDirectory = "/home/_bqn";

    sessionVariables = {
      GLFW_IM_MODULE = "ibus";
    };

    stateVersion = "24.05";
  };
}
