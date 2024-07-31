{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = [
      pkgs.vscode-extensions.catppuccin.catppuccin-vsc
      pkgs.vscode-extensions.catppuccin.catppuccin-vsc-icons
      pkgs.vscode-extensions.ms-toolsai.jupyter
      pkgs.vscode-extensions.ms-python.python
    ];
  };
}
