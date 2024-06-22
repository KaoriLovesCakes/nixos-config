{pkgs, ...}: {
  fonts.packages = [
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
    pkgs.noto-fonts-cjk
  ];
}
