{ ... }:

{
  xdg.configFile."herdr/config.toml" = {
    force = true;
    text = ''
      onboarding = false

      [theme]
      name = "kanagawa"

      [keys]
      prefix = "ctrl+g"
      rename_tab = "prefix+comma"
      settings = "prefix+shift+s"
      split_vertical = "prefix+v"
      split_horizontal = "prefix+s"
      navigate_workspace_down = "j"
      navigate_workspace_up = "k"

      [ui.toast]
      delivery = "terminal"
    '';
  };
}
