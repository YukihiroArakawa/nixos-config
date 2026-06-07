{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake .#nixos";
    };
    interactiveShellInit = ''
      set fish_greeting
    '';
  };
}
