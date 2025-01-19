{pkgs, ...}: {
  extraConfigLua = "require('kanban').setup({})";
  extraPlugins = [
    (
      (pkgs.vimUtils.buildVimPlugin {
        name = "kanban";
        src = pkgs.fetchFromGitHub {
          owner = "arakkkkk";
          repo = "kanban.nvim";
          rev = "main";
          hash = "sha256-UDY/T6NhreWpQongtRqHCcKX5/QToI1EdzkUIkT9l9A=";
        };
      })
      .overrideAttrs (old: {
        nvimSkipModule = ["kanban.integrations.telescope"];
      })
    )
  ];
}
