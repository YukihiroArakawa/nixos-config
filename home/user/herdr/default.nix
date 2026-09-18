{ ... }:

{
  xdg.configFile."herdr/config.toml" = {
    force = true;
    text = ''
      onboarding = false

      [theme]
      name = "kanagawa"

      [keys]
      settings = "prefix+shift+s"
      split_vertical = "prefix+v"
      split_horizontal = "prefix+s"

      [ui.toast]
      delivery = "terminal"
    '';
  };
}
