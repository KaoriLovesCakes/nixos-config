{
  global,
  inputs,
  ...
}: {
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  home.persistence."/persist/home/${global.username}" = {
    directories = [
      "Downloads"
      "Music"
      ".ssh"
    ];
    files = [
    ];
    allowOther = true;
  };
}
