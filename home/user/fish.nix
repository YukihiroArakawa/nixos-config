{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake .#nixos";
      # git abbr
      gs = "git status";
      gpoh = "git push origin HEAD";
      lg = "lazygit";
    };
    interactiveShellInit = ''
      set fish_greeting
    '';
  };
}
