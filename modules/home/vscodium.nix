{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = [
        pkgs.vscode-extensions.asvetliakov.vscode-neovim
        pkgs.vscode-extensions.mechatroner.rainbow-csv
        pkgs.vscode-extensions.mkhl.direnv
        pkgs.vscode-extensions.ms-toolsai.jupyter
        # pkgs.vscode-extensions.ms-python.python
      ];
      userSettings = {
        "extensions.experimental.affinity"."asvetliakov.vscode-neovim" = 1;
        "window.titleBarStyle" = "custom";
        "workbench.editor.empty.hint" = "hidden";
      };
    };
    mutableExtensionsDir = false;
    package = pkgs.vscodium;
  };
}
