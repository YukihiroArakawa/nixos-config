{ config, pkgs, ... }:

{
  imports = [
    ./fish.nix
    ./git.nix
    ./packages.nix
    ./vim.nix
  ];

  home.username = "yukihiro";
  home.homeDirectory = "/home/yukihiro";

  home.stateVersion = "26.05";
}
