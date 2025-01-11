{globals, ...}: {
  age.secrets = {
    nu = {
      file = ./secrets/nu.age;
      path = "${globals.homeDirectory}/.config/nix/nix.conf";
    };
    upsilon.file = ./secrets/upsilon.age;
  };
}
