{ config, pkgs, ... }:

{
  imports = [
    ./alacritty
    ./fish
    ./git
    ./packages.nix
    ./vim
  ];

  home.username = "yukihiro";
  home.homeDirectory = "/home/yukihiro";

  home.stateVersion = "26.05";
}
