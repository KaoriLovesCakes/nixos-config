{
  programs.nixcord = {
    enable = true;
    config = {
      plugins.fakeNitro.enable = true;
      themeLinks = ["https://raw.githubusercontent.com/dabluee/discord-themes/refs/heads/main/prsk/nightcordmini.theme.css"];
    };
  };
}
