{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = [
      pkgs.vscode-extensions.ms-toolsai.jupyter
      pkgs.vscode-extensions.ms-python.python
    ];
  };
}
