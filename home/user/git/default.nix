{ config, pkgs, ... }:

{
  programs.gh.enable = true;
  programs.git = {
    enable = true;
    settings.ghq.root = "${config.home.homeDirectory}/Workspace";
  };
}
