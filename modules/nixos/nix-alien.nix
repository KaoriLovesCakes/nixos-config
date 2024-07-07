{pkgs, ...}: {
  environment.systemPackages = [pkgs.nix-alien];
  programs.nix-ld.enable = true;
}
