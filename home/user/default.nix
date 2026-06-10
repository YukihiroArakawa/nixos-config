{ config, pkgs, ... }:

{
  imports = [
    ./alacritty
    ./browser
    ./agents
    ./fish
    ./git
    ./gnome
    ./packages.nix
    ./tmux
    ./vim
  ];

  home.username = "yukihiro";
  home.homeDirectory = "/home/yukihiro";

  home.stateVersion = "26.05";
}
