{pkgs, ...}: {
  enterShell = ''
    export CUDA_PATH=${pkgs.cudatoolkit}
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/run/opengl-driver/lib:/run/opengl-driver-32/lib
  '';

  env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.stdenv.cc.cc.lib
    pkgs.zlib
  ];

  packages = [
    pkgs.cudatoolkit
  ];

  languages.python = {
    enable = true;
    venv = {
      enable = true;
      requirements = ''
        ipykernel
        numpy
        pandas
        torch
      '';
    };
  };
}
