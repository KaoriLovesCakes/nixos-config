{globals, ...}: {
  config = {
    programs.nixvim = {
      imports = [
        ./modules
        {
          enable = true;
          defaultEditor = true;
        }
      ];
      config = {inherit (globals) base16-scheme notesDirectory;};
    };
  };
}
