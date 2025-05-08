{
  programs.git = {
    enable = true;
    extraConfig.init.defaultBranch = "main";
    userEmail = "self.bqnguyen@gmail.com";
    userName = "just-bqn";
  };
  # services.git-sync = {
  #   enable = true;
  #   repositories.notes = {
  #     interval = 300;
  #     path = "${globals.homeDirectory}/Repositories/Notes";
  #     uri = "git@github.com:just-bqn/notes";
  #   };
  # };
}
