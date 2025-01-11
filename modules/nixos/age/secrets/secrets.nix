let
  user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHPKqiihoEDe61+ZoS2f5WRb6HKoU6cvkhhqS3aRXIBi _bqn@bqn-nixos";
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPUN1UaLC9TJiH306aIxwv4Iwx5hCVvbuuN1H5+c65T5 root@bqn-nixos";
in {
  "nu.age".publicKeys = [user system];
  "upsilon.age".publicKeys = [user system];
}
