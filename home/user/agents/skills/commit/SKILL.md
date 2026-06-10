---
name: commit
description: Analyze git changes, create an appropriate Conventional Commit message, and commit the selected changes. Use when the user asks to make a commit, generate a commit message, commit current changes, or specifically wants Conventional Commit formatting.
metadata:
  short-description: Commit changes with Conventional Commits
---

# Commit

Use this workflow when committing repository changes.

## Workflow

1. Inspect the worktree:
   - `git status --short`
   - `git diff --stat`
   - `git diff`
   - If staged changes exist, also inspect `git diff --cached --stat` and `git diff --cached`.
2. Identify the intended change set.
   - If unrelated changes are present, commit only the files that match the user's request.
   - If the intended scope is ambiguous, ask before staging unrelated files.
   - Never revert or discard user changes.
3. Choose a Conventional Commit message:
   - Format: `<type>(<scope>): <description>`
   - Omit scope only when it adds no clarity.
   - Keep the description imperative, lowercase where natural, and under 72 characters.
   - Common types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `build`, `ci`, `chore`.
   - Use `feat` for new user-facing behavior, `fix` for bug fixes, `build` for package/build/Nix wiring, `chore` for maintenance.
4. Validate when reasonable:
   - Run the repo's normal lightweight check if known and relevant.
   - Do not run destructive or deploy/apply commands unless explicitly requested.
5. Stage intentionally:
   - Prefer `git add <specific-files>` over broad staging.
   - Include new files required by the change.
6. Commit:
   - Use `git commit -m "<message>"`.
   - For multi-area changes, add a short body with `git commit -m "<subject>" -m "<body>"`.
7. Report:
   - Provide the final commit hash and subject.
   - Mention validations run, or explain if skipped.

## Message Selection Hints

- NixOS/Home Manager module wiring: `build(nix): ...`
- Editor, shell, browser preference changes: `chore(<area>): ...`
- New reusable agent skill: `feat(agents): add commit skill`
- Documentation-only backup files: `docs(<area>): ...`

## Safety Rules

- Do not amend, rebase, reset, or force-push unless explicitly asked.
- Do not include secrets in commit messages or summaries.
- If `git status --short` is empty, do not create an empty commit unless explicitly requested.
