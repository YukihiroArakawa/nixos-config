{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./tmux.conf;
  };

  xdg.configFile."tmux/tmux_setup.sh" = {
    source = ./tmux_setup.sh;
    executable = true;
  };
}
