{ config, pkgs, ... }:

{
  imports = [
    ./alacritty
    ./fish
    ./git
    ./packages.nix
    ./tmux
    ./vim
  ];

  home.username = "yukihiro";
  home.homeDirectory = "/home/yukihiro";

  home.stateVersion = "26.05";
}
