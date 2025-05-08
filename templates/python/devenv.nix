{pkgs, ...}: {
  dotenv.enable = true;

  enterShell = ''
    export CUDA_PATH=${pkgs.cudatoolkit}
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/run/opengl-driver/lib:/run/opengl-driver-32/lib
  '';

  env = {
    CUBLAS_WORKSPACE_CONFIG = ":4096:8";
    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
      pkgs.glib
      pkgs.libGL
      pkgs.stdenv.cc.cc.lib
      pkgs.zlib
    ];
  };

  languages.python = {
    enable = true;
    venv = {
      enable = true;
      requirements = builtins.readFile ./requirements.txt;
    };
  };

  packages = [
    pkgs.cudatoolkit
  ];
}
