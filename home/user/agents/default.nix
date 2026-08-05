{ config, lib, pkgs, ... }:

let
  skillsDir = ./skills;
  codexNotify = pkgs.writeShellApplication {
    name = "codex-notify";
    runtimeInputs = [ pkgs.pipewire ];
    text = ''
      pw-play ${pkgs."sound-theme-freedesktop"}/share/sounds/freedesktop/stereo/complete.oga || true
    '';
  };
  codexPermissionNotify = pkgs.writeShellApplication {
    name = "codex-permission-notify";
    runtimeInputs = [ pkgs.pipewire ];
    text = ''
      pw-play ${pkgs."sound-theme-freedesktop"}/share/sounds/freedesktop/stereo/dialog-warning.oga || true
    '';
  };
  skillNames = lib.attrNames (
    lib.filterAttrs (_: type: type == "directory") (builtins.readDir skillsDir)
  );
  skillFiles =
    platform:
    builtins.listToAttrs (
      map (name: {
        name = ".${platform}/skills/${name}";
        value.source = skillsDir + "/${name}";
      }) skillNames
    );
in
{
  home.packages = [
    pkgs.codex
  ];

  home.file =
    skillFiles "codex"
    // skillFiles "claude"
    // {
      ".codex/hooks.json".text = builtins.toJSON {
        description = "Play a sound when Codex needs attention.";
        hooks = {
          Stop = [
            {
              hooks = [
                {
                  type = "command";
                  command = "${codexNotify}/bin/codex-notify";
                  timeout = 3;
                }
              ];
            }
          ];
          PermissionRequest = [
            {
              hooks = [
                {
                  type = "command";
                  command = "${codexPermissionNotify}/bin/codex-permission-notify";
                  timeout = 3;
                }
              ];
            }
          ];
          SubagentStop = [
            {
              hooks = [
                {
                  type = "command";
                  command = "${codexNotify}/bin/codex-notify";
                  timeout = 3;
                }
              ];
            }
          ];
        };
      };
    };
}
