---
name: grill-me
description: Interview the user relentlessly about a plan or design until reaching shared understanding, resolving each branch of the decision tree. Use when user wants to stress-test a plan, get grilled on their design, or mentions "grill me".
---

# Grill Me

Use this workflow to stress-test a user's plan or design through focused questioning.

## Workflow

1. Identify the plan, design, or decision under review.
   - If the user has not provided enough context to start, ask for the plan in one concise question.
   - If relevant facts can be discovered from the codebase, inspect the codebase instead of asking.
2. Build a decision tree mentally:
   - Goals and non-goals
   - Users and workflows
   - Constraints and dependencies
   - Data model and APIs
   - Failure modes and edge cases
   - Security, privacy, performance, operations, and migration concerns
   - Rollout, testing, and reversibility
3. Ask exactly one question at a time.
   - Make each question concrete and answerable.
   - Include the recommended answer after the question.
   - Explain briefly why that branch matters when useful.
4. Resolve dependencies between decisions.
   - Do not jump to unrelated branches while a blocking decision is unresolved.
   - When an answer creates new constraints, update the remaining decision tree.
5. Continue until shared understanding is reached.
   - Summarize settled decisions when moving between major branches.
   - Call out remaining risks, assumptions, and open questions.

## Question Format

Use this shape by default:

```text
Question: <one focused question>

Recommended answer: <the answer you think is best, with a short rationale>
```

## Codebase Rule

If a question can be answered by reading files, searching the repo, running tests, or inspecting local configuration, do that first. Ask the user only for intent, priority, product judgment, or information that cannot be inferred locally.

## Tone

Be direct and persistent, but not theatrical. The goal is shared clarity, not performative criticism.
