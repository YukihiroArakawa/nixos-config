{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake .#nixos";
      # Run after changing home/user; system-level changes still need nrs.
      hms = "home-manager switch --flake .#yukihiro";
      # git abbr
      gs = "git status";
      gpoh = "git push origin HEAD";
      lg = "lazygit";
    };
    interactiveShellInit = ''
      set fish_greeting
    '';
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
