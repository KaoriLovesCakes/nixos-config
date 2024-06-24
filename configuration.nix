{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    ./modules/nixos
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  environment = {
    systemPackages = [pkgs.git];
    variables = {
      EDITOR = "nvim";
      GLFW_IM_MODULE = "ibus";
    };
  };

  hardware.enableAllFirmware = true;

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs pkgs;};
    users._bqn = import ./home.nix;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs = {
    overlays = [inputs.jeezyvim.overlays.default];
    config.allowUnfree = true;
  };

  #security.rtkit.enable = true;

  services.xserver = {
    enable = true;
    desktopManager.plasma5.enable = true;
  };

  users.users._bqn = {
    isNormalUser = true;
    description = "_bqn";
    extraGroups = ["networkmanager" "wheel" "video"];
  };

  system.stateVersion = "24.11";
}
