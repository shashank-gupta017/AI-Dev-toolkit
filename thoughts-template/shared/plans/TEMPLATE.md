# Implementation Plan Template

Use this template when creating new implementation plans.

# [Feature/Task Name] Implementation Plan

## Overview
[Brief description of what we're implementing and why]

## Current State Analysis
[What exists now, what's missing, key constraints]

## Desired End State
[Specification of the end state and verification criteria]

## What We're NOT Doing
[Explicit out-of-scope items to prevent scope creep]

## Implementation Approach
[High-level strategy and reasoning]

---

## Phase 1: [Descriptive Name]

### Overview
[What this phase accomplishes]

### Changes Required

#### 1. [Component/File Group]
**File**: `path/to/file.ext`  
**Changes**: [Summary of changes]

```language
// Specific code to add/modify
```

### Success Criteria

#### Automated Verification:
- [ ] Tests pass: `npm test`
- [ ] Build succeeds: `npm run build`
- [ ] Linting passes: `npm run lint`
- [ ] Type checking: `npm run typecheck`

#### Manual Verification:
- [ ] Feature works as expected in UI/CLI
- [ ] Performance is acceptable
- [ ] Edge cases handled
- [ ] No regressions in related features

**Implementation Note**: Pause after automated verification for manual testing confirmation before proceeding to next phase.

---

## Phase 2: [Descriptive Name]

[Similar structure]

---

## Testing Strategy

### Unit Tests
- [What to test]
- [Key edge cases]

### Integration Tests
- [End-to-end scenarios]

### Manual Testing Steps
1. [Specific verification step]
2. [Another verification step]

## Performance Considerations
[Any performance implications or optimizations]

## Migration Notes
[If applicable, how to handle existing data/systems]

## References
- Original ticket: [Link or path]
- Related research: `thoughts/shared/research/[relevant].md`
- Similar implementation: `[file:line]`
