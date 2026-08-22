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
    functions.timer = {
      description = "Wait for the specified number of minutes";
      body = ''
        if test (count $argv) -ne 1; or not string match --quiet --regex '^[0-9]+$' -- $argv[1]
          echo "Usage: timer MIN" >&2
          return 2
        end

        set -l minutes $argv[1]
        sleep "$minutes"m
        ${pkgs.pipewire}/bin/pw-play ${pkgs."sound-theme-freedesktop"}/share/sounds/freedesktop/stereo/complete.oga
        echo "$minutes min completed"
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
