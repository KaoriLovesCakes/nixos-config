{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      colors.transparent_background_colors = true;
      cursor = {
        style.shape = "Beam";
        vi_mode_style.shape = "Block";
      };
      terminal.shell.program = "${pkgs.fish}/bin/fish";
      window.padding = {
        x = 12;
        y = 12;
      };
    };
  };
}
