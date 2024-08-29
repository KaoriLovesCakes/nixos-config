{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = [
      pkgs.vscode-extensions.asvetliakov.vscode-neovim
      pkgs.vscode-extensions.ms-toolsai.jupyter
      pkgs.vscode-extensions.ms-python.python
    ];
    userSettings."extensions.experimental.affinity"."asvetliakov.vscode-neovim" = 1;
  };
}
