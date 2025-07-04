{
  pkgs,
  globals,
  ...
}: {
  systemd.user.services.ksshaskpass-start = {
    Install.WantedBy = ["plasma-workspace.target"];
    Service = {
      ExecStart = ''
        ${
          pkgs.writeShellScript "ksshaskpass-start" ''
            #!${pkgs.bash}/bin/bash

            SSH_ASKPASS=${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass ${pkgs.openssh}/bin/ssh-add < /dev/null
            ${pkgs.openssh}/bin/ssh-add ${globals.homeDirectory}/.ssh/id_ed25519
          ''
        }
      '';
      Restart = "on-failure";
    };
    Unit = {
      After = ["plasma-workspace.target"];
      Description = "Starts ksshaskpass.";
    };
  };
}
