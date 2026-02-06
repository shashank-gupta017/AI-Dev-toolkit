# Quick Reference

> **Agents** work by name in conversation: *"Use codebase-locator to find..."*
> **Commands** are workflow templates. Invoke by asking Copilot: *"Read .claude/commands/[name].md and follow it"* or describe what you want directly. Some may be available as skills (`/skills list`).

## Agents

| Agent | Purpose | Example |
|-------|---------|---------|
| `codebase-locator` | Find WHERE files live | *"Find all API routes"* |
| `codebase-analyzer` | Explain HOW code works | *"Trace the login flow"* |
| `codebase-pattern-finder` | Show patterns to follow | *"Show pagination examples"* |
| `thoughts-locator` | Find knowledge base docs | *"Find auth research"* |
| `thoughts-analyzer` | Extract insights from docs | *"Key decisions in doc X"* |
| `web-search-researcher` | Research external info | *"Stripe webhook best practices"* |

Use agents in conversation: *"Use codebase-locator to find all authentication files"*

---

## Commands

### No Setup Needed

| Command | Purpose |
|---------|---------|
| `/commit` | Review changes, propose commit messages, ask for confirmation |
| `/ci_commit` | Autonomous commits (for CI/automation) |
| `/create_plan_nt` | Create implementation plan |
| `/create_plan_generic` | Create plan (no external tool refs) |
| `/research_codebase_nt` | Research and document codebase |
| `/research_codebase_generic` | Research (no external tool refs) |
| `/iterate_plan_nt` | Refine an existing plan |

### Need `thoughts/` Directory

| Command | Purpose |
|---------|---------|
| `/create_plan` | Thorough planning with parallel research |
| `/implement_plan [path]` | Execute plan phase-by-phase with verification |
| `/iterate_plan [path]` | Refine plan based on feedback |
| `/validate_plan [path]` | Verify implementation matches plan |
| `/research_codebase` | Deep research with historical context |
| `/describe_pr` | Generate PR description from changes |
| `/ci_describe_pr` | PR description (for CI/automation) |
| `/create_handoff` | Save session context for later |
| `/resume_handoff [path]` | Resume from handoff document |
| `/create_worktree` | Set up git worktree + launch implementation |
| `/founder_mode` | Retroactive ticket + PR for experimental work |

---

## Common Workflows

**Understand code:**
```
Use codebase-locator to find [feature] files
Use codebase-analyzer to explain how [feature] works
```

**Plan → Build → Ship:**
```
/create_plan_nt
/implement_plan thoughts/shared/plans/YYYY-MM-DD-feature.md
/validate_plan thoughts/shared/plans/YYYY-MM-DD-feature.md
/commit
/describe_pr
```

**Research:**
```
/research_codebase_nt "How does [X] work?"
```

**Pause / Resume work:**
```
/create_handoff
/resume_handoff thoughts/shared/handoffs/TICKET/YYYY-MM-DD_handoff.md
```

---

## Decision Guide

| You Need To... | Use |
|----------------|-----|
| Find files | `codebase-locator` agent |
| Understand code | `codebase-analyzer` agent |
| Follow existing patterns | `codebase-pattern-finder` agent |
| Research external tools | `web-search-researcher` agent |
| Plan a feature | `/create_plan_nt` |
| Build from a plan | `/implement_plan [path]` |
| Commit changes | `/commit` |
| Create PR | `/describe_pr` |
| Save session context | `/create_handoff` |

---

## Tips

- **`_nt` commands** work without any setup — start with these
- **Agents are read-only** and safe to use anytime
- **Commands ask before changing** anything — you stay in control
- **Research before planning** — agents find patterns to follow
- **Commit after each phase** of `/implement_plan`
