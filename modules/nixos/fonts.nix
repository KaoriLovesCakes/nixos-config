{pkgs, ...}: {
  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.newcomputermodern
    # pkgs.noto-fonts-cjk-sans
    # pkgs.noto-fonts-cjk-serif
    pkgs.source-han-sans
    pkgs.source-han-serif
  ];
}
