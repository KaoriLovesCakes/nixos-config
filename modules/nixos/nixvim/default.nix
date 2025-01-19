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
      config = {
        inherit (globals) base16Scheme;
        cpDirectory = "${globals.homeDirectory}/Repositories/Competitive Programming";
      };
    };
  };
}
