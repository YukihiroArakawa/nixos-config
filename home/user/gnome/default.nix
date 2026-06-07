{ config, lib, pkgs, ... }:

{
  home.activation.copyGnomeMonitorsXml = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    $DRY_RUN_CMD install -D -m 0644 ${./monitors.xml} ${config.xdg.configHome}/monitors.xml
  '';
}
