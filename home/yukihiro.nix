{ config, pkgs, ... }:

{
  home.username = "yukihiro";
  home.homeDirectory = "/home/yukihiro";

  home.stateVersion = "26.05";

  programs.git.enable = true;
}
