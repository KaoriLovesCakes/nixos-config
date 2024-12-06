{inputs, ...}: {
  imports = [inputs.aagl-gtk-on-nix.nixosModules.default];
  nix.settings = inputs.aagl-gtk-on-nix.nixConfig;
  programs = {
    honkers-railway-launcher.enable = true;
    steam.enable = true;
  };
}
