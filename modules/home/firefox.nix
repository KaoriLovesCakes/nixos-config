{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    profiles.default.extensions.packages = [
      pkgs.nur.repos.rycee.firefox-addons.tridactyl
    ];
  };
}
