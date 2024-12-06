{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = [pkgs.nix-alien];
  nixpkgs.overlays = [inputs.nix-alien.overlays.default];
  programs.nix-ld.enable = true;
}
