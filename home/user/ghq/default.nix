{
  config,
  lib,
  pkgs,
  ...
}:

let
  ghqRoot = "${config.home.homeDirectory}/Workspace";
  repositories = [
    {
      url = "git@github.com:YukihiroArakawa/blind75.git";
      path = "github.com/YukihiroArakawa/blind75";
    }
    {
      url = "git@github.com:YukihiroArakawa/english-yukiotechblog.git";
      path = "github.com/YukihiroArakawa/english-yukiotechblog";
    }
    {
      url = "git@github.com:YukihiroArakawa/music-score.git";
      path = "github.com/YukihiroArakawa/music-score";
    }
    {
      url = "git@github.com:YukihiroArakawa/nixos-config.git";
      path = "github.com/YukihiroArakawa/nixos-config";
    }
    {
      url = "git@github.com:YukihiroArakawa/yukiotechblog.git";
      path = "github.com/YukihiroArakawa/yukiotechblog";
    }
  ];
in
{
  home.activation.cloneGhqRepositories = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    # The new Home Manager profile is not on PATH yet, but ghq needs git and SSH to clone repositories.
    export PATH="${
      lib.makeBinPath [
        pkgs.git
        pkgs.openssh
      ]
    }:$PATH"

    ${lib.concatMapStringsSep "\n" (repository: ''
      repositoryPath=${lib.escapeShellArg "${ghqRoot}/${repository.path}"}

      if [ ! -d "$repositoryPath/.git" ]; then
        $DRY_RUN_CMD ${pkgs.ghq}/bin/ghq get ${lib.escapeShellArg repository.url}
      fi
    '') repositories}
  '';
}
