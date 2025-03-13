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
      ExecStartPost = ''
        ${
          pkgs.writeShellScript "git-sync-notes-service-restart" ''
            #!${pkgs.bash}/bin/bash

            ${pkgs.systemd}/bin/systemctl --user restart git-sync-notes
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
