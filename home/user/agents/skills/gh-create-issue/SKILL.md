---
name: gh-create-issue
description: Create a GitHub issue with the repository's task issue template by using the gh CLI. Use when the user asks to create, file, or open an issue for planned work in the current repository, especially when they want the issue written in English or based on .github/ISSUE_TEMPLATE/task.md.
---

# Create GitHub Issue

Create one well-scoped issue from the current repository's task template.

## Workflow

1. Check the repository and authentication with `gh repo view` and `gh auth status`.
2. Read `.github/ISSUE_TEMPLATE/task.md`. Preserve its section order and intent, but omit its YAML frontmatter and HTML comments from the issue body.
3. Inspect relevant repository files when they can clarify the requested work.
4. Draft a concise English title and body. Do not invent requirements; leave genuinely unknown details explicit.
5. Show the exact title and body to the user and obtain confirmation before creating the issue. Creating an issue is an external write.
6. Write the approved body to a temporary file and run:

   ```bash
   gh issue create --title "<title>" --body-file "<temporary-file>"
   ```

   Use `--repo OWNER/REPO` when the target is not the current repository. Do not add labels, assignees, or milestones unless requested.
7. Report the created issue number and URL, then remove the temporary file.

## Interactive Use

When the user wants to fill in the template themselves, run:

```bash
gh issue create --template task.md
```

Do not draft or create duplicate issues if the command fails or the result is uncertain. Check `gh issue list` before retrying.
