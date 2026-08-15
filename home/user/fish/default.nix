{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    functions.cghq = {
      description = "Change directory to a ghq repository";
      body = ''
        set -l repository (ghq list --full-path | fzf --prompt="Repository> ")
        test -n "$repository"; and cd "$repository"
      '';
    };
    shellAbbrs = {
      nrp = "nix run nixpkgs#";
      nrs = "sudo nixos-rebuild switch --flake .#nixos";
      # Run after changing home/user; system-level changes still need nrs.
      hms = "home-manager switch --flake .#yukihiro";
      # git abbr
      gs = "git status";
      gpoh = "git push origin HEAD";
      lg = "lazygit";
      tmuxev = "tmux select-layout even-vertical";
      tmuxeh = "tmux select-layout even-horizontal";
    };
    interactiveShellInit = ''
      set fish_greeting
    '';
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
