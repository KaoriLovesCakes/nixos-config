{pkgs, ...}: {
  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.newcomputermodern
    pkgs.source-han-sans
    pkgs.source-han-serif
  ];
}
