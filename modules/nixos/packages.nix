{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.anki-bin
    pkgs.caprine
    pkgs.discord
    pkgs.libreoffice-qt
    pkgs.mpv
    pkgs.obs-studio
    pkgs.obsidian
    pkgs.qbittorrent
    # pkgs.zen-browser

    pkgs.betterdiscordctl
    pkgs.cachix
    pkgs.devenv
    pkgs.fastfetch
    pkgs.fd
    pkgs.ffmpeg
    pkgs.git
    pkgs.hyfetch
    pkgs.nix-tree
    pkgs.p7zip
    pkgs.progress
    pkgs.rclone
    pkgs.ripgrep
    pkgs.rofimoji
    pkgs.typst
    pkgs.wl-clipboard

    # (pkgs.stdenv.mkDerivation {
    #   name = "kabmat";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "PlankCipher";
    #     repo = "kabmat";
    #     rev = "v2.7.0";
    #     hash = "sha256-EnkW14L/y20IrSDxO7kbMP33/jEMKCLR6+m3V92BfMQ=";
    #   };
    #   nativeBuildInputs = [pkgs.gcc pkgs.ncurses];
    #   buildPhase = "export HOME=$(mktemp -d) && make";
    #   installPhase = ''
    #     mkdir -p $out/bin
    #     cp kabmat $out/bin
    #   '';
    # })

    (pkgs.python3Packages.buildPythonPackage rec {
      pname = "kanban_python";
      version = "0.5.2";
      pyproject = true;
      src = pkgs.fetchPypi {
        inherit pname version;
        hash = "sha256-Zve2OoZ4wpvswPkRqdXYA3V9krEd87PVjvyMu+C/5ng=";
      };
      build-system = [
        pkgs.python3Packages.hatchling
      ];
      dependencies = [
        pkgs.python3Packages.rich
        pkgs.python3Packages.platformdirs
      ];
    })
  ];
}
