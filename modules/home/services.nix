{
  pkgs,
  globals,
  ...
}: {
  systemd.user = {
    enable = true;
    startServices = "sd-switch";

    services = {
      qbittorrent-start = {
        Install.WantedBy = ["default.target"];
        Service = {
          ExecStart = ''
            ${
              pkgs.writeShellScript "qbittorrent-start" ''
                #!${pkgs.bash}/bin/bash

                ${pkgs.qbittorrent}/bin/qbittorrent
              ''
            }
          '';
          Restart = "on-failure";
        };
        Unit.Description = "Starts qBittorrent.";
      };

      ksshaskpass-start = {
        Install.WantedBy = ["default.target"];
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
        Unit.Description = "Starts ksshaskpass.";
      };
    };
  };
}
