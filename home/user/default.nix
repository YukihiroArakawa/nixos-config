{ config, pkgs, ... }:

{
  imports = [
    ./alacritty
    ./browser
    ./agents
    ./fish
    ./ghq
    ./git
    ./gnome
    ./lazygit
    ./mozc
    ./packages.nix
    ./tmux
    ./vim
  ];

  home.username = "yukihiro";
  home.homeDirectory = "/home/yukihiro";

  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
