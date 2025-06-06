{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = [
        # pkgs.open-vsx.google.geminicodeassist
        pkgs.vscode-extensions.charliermarsh.ruff
        pkgs.vscode-extensions.mechatroner.rainbow-csv
        pkgs.vscode-extensions.mkhl.direnv
        pkgs.vscode-extensions.ms-python.python
        pkgs.vscode-extensions.ms-toolsai.jupyter
        pkgs.vscode-extensions.ms-toolsai.jupyter-renderers
      ];
      userSettings = {
        "direnv.path.executable" = "${pkgs.direnv}/bin/direnv";
        "editor.formatOnSave" = true;
        "notebook.defaultFormatter" = "ms-python.python";
        "notebook.formatOnSave.enabled" = true;
        "window.titleBarStyle" = "custom";
        "workbench.editor.empty.hint" = "hidden";
      };
    };
    mutableExtensionsDir = false;
    package = pkgs.vscodium;
  };
}
