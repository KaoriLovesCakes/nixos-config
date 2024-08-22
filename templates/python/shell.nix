{pkgs, ...}: {
  env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.stdenv.cc.cc.lib
    pkgs.zlib
  ];

  languages.python = {
    enable = true;
    venv = {
      enable = true;
      requirements = ''
        numpy
        pandas
      '';
    };
  };
}
