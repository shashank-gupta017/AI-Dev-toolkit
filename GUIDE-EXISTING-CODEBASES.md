# Working with Existing Codebases

A practical guide to using the AI Dev Toolkit for new feature development, system improvements, and long-term maintainability in codebases you already have.

> **Using Claude Code instead?** See [README-CLAUDE-CODE.md](README-CLAUDE-CODE.md) — commands work as native `/slash_commands` there.

---

## How to Use This Toolkit in Copilot CLI

**Agents** are loaded automatically. Use them by name in conversation:
```
Use codebase-locator to find all API routes
```

**Commands** are workflow templates. Invoke them by asking Copilot to follow the file:
```
Read .claude/commands/research_codebase_nt.md and follow those instructions.
Research how our authentication system works.
```

Or describe what you want and Copilot will use the right workflow:
```
Research how our authentication system works
```

Some commands may be available as skills — run `/skills list` to check.

---

## Getting Started in an Existing Codebase

### Install the Toolkit

```bash
cd your-existing-project
cp -r /path/to/AI-Dev-toolkit/.claude .

# Optional: set up knowledge base
mkdir -p thoughts/shared/{research,plans,prs,tickets}
echo "thoughts/searchable/" >> .gitignore

git add .claude/ thoughts/ .gitignore
git commit -m "Add AI Dev Toolkit"
```

### Orient Yourself (Day 1)

Before changing anything, use agents to understand what you're working with:

```
Use codebase-locator to find the main application entry points
and directory structure
```

```
Use codebase-analyzer to explain the high-level architecture —
how requests flow from entry to response
```

```
Use codebase-pattern-finder to show the patterns used for
API routes, database access, and error handling
```

These three prompts give you a working mental model of any codebase in minutes.

---

## New Feature Development

### Step 1: Research the Area You'll Touch

Before writing a plan, understand what exists:

```
Read .claude/commands/research_codebase_nt.md and follow those instructions.
How does the notification system work? Include database models,
API routes, and any background jobs.
```

This spawns parallel agents to:
- **Locate** all relevant files
- **Analyze** how the code works
- **Find patterns** to follow

The output is a research document with file:line references you can read before planning.

### Step 2: Check for Existing Patterns

```
Use codebase-pattern-finder to show how we add new API endpoints
including route registration, validation, and tests
```

This is critical in existing codebases. The AI finds your established conventions so the new feature follows them exactly.

### Step 3: Plan the Feature

```
Read .claude/commands/create_plan_nt.md and follow those instructions.
Add email notification preferences. Users should be able to configure
which events trigger emails (task assigned, comment added, due date
approaching). Follow our existing notification patterns.
```

Because you researched first, the plan will reference actual files and follow existing patterns rather than inventing new approaches.

### Step 4: Review and Refine the Plan

Read the generated plan. If something needs adjustment:

```
Read .claude/commands/iterate_plan_nt.md and follow those instructions.
The plan is at thoughts/shared/plans/YYYY-MM-DD-email-preferences.md.
The plan should use our existing event bus instead of direct calls.
See src/lib/events.ts for the pattern.
```

### Step 5: Implement

```
Read .claude/commands/implement_plan.md and follow those instructions.
The plan is at thoughts/shared/plans/YYYY-MM-DD-email-preferences.md
```

The workflow implements each phase, runs your existing test suite, and pauses for manual verification. If the implementation hits a conflict with existing code, it stops and asks for guidance.

### Step 6: Validate and Ship

```
Read .claude/commands/validate_plan.md and follow those instructions.
The plan is at thoughts/shared/plans/YYYY-MM-DD-email-preferences.md
```

Then commit and create the PR:

```
Read .claude/commands/commit.md and follow those instructions
```

```
Read .claude/commands/describe_pr.md and follow those instructions
```

---

## System Improvements

### Refactoring

**Research first, then plan the refactor:**

```
Read .claude/commands/research_codebase_nt.md and follow those instructions.
Document all places where database queries are made directly instead of
going through the repository layer. Include file paths and line numbers.
```

```
Read .claude/commands/create_plan_nt.md and follow those instructions.
Refactor all direct database queries to use the repository pattern.
Based on the research, there are 12 files that need updating.
Follow the pattern in src/repositories/userRepository.ts.
```

```
Read .claude/commands/implement_plan.md and follow those instructions.
The plan is at thoughts/shared/plans/YYYY-MM-DD-repository-refactor.md
```

The plan-and-implement cycle ensures refactors are systematic rather than ad-hoc.

### Performance Improvements

Use agents to understand bottlenecks before optimizing:

```
Use codebase-analyzer to trace the complete data flow for the
dashboard page — from route handler through all database queries
to the final response
```

```
Use codebase-pattern-finder to show all N+1 query patterns
or places where we query inside loops
```

Then plan the fix:

```
Read .claude/commands/create_plan_nt.md and follow those instructions.
Optimize the dashboard endpoint. Based on analysis, there are
3 N+1 queries that should be batched. See the research for details.
```

### Dependency Upgrades

```
Use web-search-researcher to find the migration guide for
upgrading from Prisma 4 to Prisma 5, including breaking changes
```

```
Read .claude/commands/research_codebase_nt.md and follow those instructions.
Find all Prisma usage including models, queries, middleware,
and configuration.
```

```
Read .claude/commands/create_plan_nt.md and follow those instructions.
Upgrade Prisma from v4 to v5. The migration guide says X, Y, Z
are breaking changes. Our codebase uses these features in the
files found by the research.
```

### Fixing Technical Debt

```
Read .claude/commands/research_codebase_nt.md and follow those instructions.
Find all TODO comments, deprecated function usage, and inconsistent
patterns in the auth module.
```

Use this research as input to a plan:

```
Read .claude/commands/create_plan_nt.md and follow those instructions.
Address technical debt in the auth module based on the research
document. Prioritize: 1) remove deprecated bcrypt usage,
2) standardize error codes, 3) add missing input validation.
```

---

## Long-Term Maintainability

### Build a Knowledge Base

Every time you research or plan, the toolkit creates documents in `thoughts/`. Over time, this becomes your project's institutional memory.

**Research documents** (`thoughts/shared/research/`) capture:
- How systems work today
- Architectural decisions and their rationale
- File references that stay useful for months

**Plans** (`thoughts/shared/plans/`) capture:
- What was planned vs what was built
- Phased approaches to complex changes
- Success criteria that become regression tests

**PR descriptions** (`thoughts/shared/prs/`) capture:
- Why changes were made
- What was considered and rejected
- Testing strategy

### Onboard New Developers

A new developer can use agents to ramp up instantly:

```
Use codebase-locator to map the project structure — show all
major directories and what they contain
```

```
Use codebase-analyzer to explain the authentication flow
end-to-end
```

```
Use thoughts-locator to find all research documents and plans
related to the billing system
```

```
Use thoughts-analyzer to extract key architectural decisions
from the research documents
```

In one session, a new developer gets the understanding that used to take weeks of code reading.

### Maintain Consistency at Scale

As teams grow, patterns drift. Use agents periodically to audit:

```
Use codebase-pattern-finder to show all different error handling
approaches used across the codebase
```

If drift is found, create a standardization plan:

```
Read .claude/commands/create_plan_nt.md and follow those instructions.
Standardize error handling. We have 3 different patterns
(see pattern-finder output). Converge on the pattern in
src/lib/errors.ts which is the most complete.
```

### Cross-Session Continuity

When working on multi-day features:

**End of session:**
```
Read .claude/commands/create_handoff.md and follow those instructions
```

This captures what you did, what you learned, key file references, and next steps.

**Start of next session:**
```
Read .claude/commands/resume_handoff.md and follow those instructions.
The handoff is at thoughts/shared/handoffs/TICKET/YYYY-MM-DD_handoff.md
```

The workflow reads the handoff, verifies the codebase state matches expectations, and creates a task list to continue.

---

## Workflow Patterns by Scenario

### Bug Fix (Small)

```
Use codebase-analyzer to explain how [broken feature] works
# Understand the bug, fix it manually
Read .claude/commands/commit.md and follow those instructions
```

### Bug Fix (Complex)

```
Read .claude/commands/research_codebase_nt.md and follow those instructions.
Trace the complete flow for [broken feature] including edge cases
and error paths.

Read .claude/commands/create_plan_nt.md and follow those instructions.
Fix [bug]. Root cause is [X] based on the research.
The fix needs to handle [edge cases].

Read .claude/commands/implement_plan.md and follow those instructions.
The plan is at [path]

Read .claude/commands/commit.md and follow those instructions
Read .claude/commands/describe_pr.md and follow those instructions
```

### New Feature (Small)

```
Use codebase-pattern-finder to show how we implement [similar feature]
# Follow the pattern manually
Read .claude/commands/commit.md and follow those instructions
```

### New Feature (Large)

Follow the full cycle: Research → Plan → Implement → Validate → Commit → PR

### Refactor

Follow: Research → Plan → Implement → Validate → Commit → PR

### Code Review

```
Read .claude/commands/research_codebase_nt.md and follow those instructions.
Understand the changes in PR #123 and how they affect the existing system.
```

### Architecture Documentation

```
Read .claude/commands/research_codebase_nt.md and follow those instructions.
Document the complete architecture of [system] including data flow,
external integrations, and error handling.
```

---

## Tips for Existing Codebases

1. **Research before everything.** In an existing codebase, the AI's biggest value is understanding what's already there. Always research before planning changes.

2. **Pattern-finder is your best friend.** It ensures new code matches established conventions. Use it before every feature.

3. **Plans prevent drift.** Even for small changes, running the plan workflow ensures the AI follows your patterns instead of introducing new ones.

4. **Accumulate knowledge.** Keep `thoughts/` committed to git. In 3 months you'll have a searchable knowledge base of every decision, plan, and research doc.

5. **Use handoffs religiously.** Context loss between sessions is the biggest productivity killer. The handoff workflow takes 30 seconds and saves hours.

6. **Validate after implementing.** The validate workflow catches gaps between what was planned and what was built. Use it before every PR.

7. **Agents are free exploration.** They're read-only and safe. Use them liberally to understand unfamiliar code before touching it.
