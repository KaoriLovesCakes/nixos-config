{pkgs, ...}: {
  languages.cplusplus.enable = true;

  packages = [pkgs.lldb];

  scripts = {
    build.exec = ''
      clang++ ./main.cpp -g -o main
    '';

    build-debug.exec = ''
      build && debug
    '';

    build-run.exec = ''
      build && run
    '';

    debug.exec = ''
      lldb -- main
    '';

    run.exec = ''
      ./main
    '';
  };
}
