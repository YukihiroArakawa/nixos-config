{ config, lib, pkgs, ... }:

{
  dconf.settings = {
    # Use Super+number for workspace switching.
    "org/gnome/desktop/wm/keybindings" = {
      # Let fcitx5 handle input method switching instead of GNOME.
      switch-input-source = [];
      switch-input-source-backward = [];
      activate-window-menu = [];

      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-5 = [ "<Super>5" ];
    };

    # Free Super+number from GNOME Shell's favorite application shortcuts.
    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-5 = [];
    };

    # Keep a stable set of numbered workspaces.
    "org/gnome/mutter" = {
      dynamic-workspaces = false;
    };

    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 5;
    };

    # Use natural scrolling for both touchpad and mouse.
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = true;
      speed = 0.8;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = true;
      speed = 0.8;
    };
  };

  # Copy as a writable file so GNOME Display Settings can update it.
  home.activation.copyGnomeMonitorsXml = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    $DRY_RUN_CMD install -D -m 0644 ${./monitors.xml} ${config.xdg.configHome}/monitors.xml
  '';
}
