{pkgs, ...}: {
  environment.systemPackages = [pkgs.rclone];
  nixpkgs.overlays = [
    (final: prev: {
      rclone = prev.rclone.overrideAttrs (old: {
        version = "with-iclouddrive";
        src = pkgs.fetchFromGitHub {
          owner = "rclone";
          repo = "rclone";
          rev = "500698c5be5394301f30eaed1c4def24299bf7eb";
          hash = "sha256-ZJ7sMm3zM822WE4wFnB5v/PM25MSoMJcZ8i2J4Y7cA0=";
        };
        vendorHash = "sha256-JyfDNbL1VAfcVg3GlFVTP97Kw/8h4d8l0+irloLxnqs=";
      });
    })
  ];
}
