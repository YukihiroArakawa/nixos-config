{ pkgs, ... }:

let
  codexCommitSkill = pkgs.writeShellApplication {
    name = "codex-commit-skill";
    runtimeInputs = with pkgs; [
      codex
      git
    ];
    text = ''
            repo="$(git rev-parse --show-toplevel)"
            cd "$repo"

            codex --ask-for-approval never --model gpt-5.4-mini exec -C "$repo" "\$commit

      Commit only the currently staged changes. If nothing is staged, inspect the worktree and ask before staging anything."
    '';
  };
in
{
  home.packages = [
    codexCommitSkill
  ];

  xdg.configFile."lazygit/config.yml" = {
    force = true;
    text = ''
      customCommands:
        - key: '<c-a>'
          context: 'global'
          description: 'AI commit with Codex'
          command: 'codex-commit-skill'
          loadingText: 'Committing with Codex'
    '';
  };
}
