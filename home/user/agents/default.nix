{ config, lib, pkgs, ... }:

let
  skillsDir = ./skills;
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
  home.file = skillFiles "codex" // skillFiles "claude";
}
