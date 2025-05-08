{
  programs.nixvim = {
    imports = [
      ./modules
      {
        enable = true;
        defaultEditor = true;
      }
    ];
  };
}
