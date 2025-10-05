{pkgs, ...}: {
  dotenv.enable = true;

  enterShell = ''
    export CUDA_PATH=${pkgs.cudatoolkit}
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/run/opengl-driver/lib:/run/opengl-driver-32/lib
  '';

  env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.stdenv.cc.cc.lib
    pkgs.zlib
  ];

  languages.python = {
    enable = true;
    uv.enable = true;
  };

  packages = [pkgs.cudatoolkit];
}
