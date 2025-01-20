{pkgs, ...}: {
  fonts.packages = [
    # pkgs.comic-relief
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.noto-fonts
    pkgs.noto-fonts-cjk-sans
    # pkgs.noto-fonts-cjk-serif
    # pkgs.ipaexfont
  ];
}
