# Plan Phase Command

This command creates a detailed implementation plan based on validated research, validates the plan using AI agents, and prepares for the implementation phase.

## Usage
```bash
claude -p "/plan ISSUE-123"
```

## Process Overview

1. **Load Research**: Read and understand the validated research document
2. **Create Implementation Plan**: Break down into atomic, executable tasks
3. **AI Validation Loop**: Spawn validation agent to score plan (up to 3 iterations)
4. **Human Handoff**: Provide explicit next steps

## Phase 1: Research Analysis

**Read the research document completely:**
- `thoughts/{ISSUE_ID}/research.md`
- Understand problem statement and requirements
- Review system analysis and constraints
- Note all file references and integration points

**Think deeply** about the implementation approach before proceeding.

## Phase 2: Plan Creation

Create `thoughts/{ISSUE_ID}/plan.md` with:

```markdown
# Implementation Plan: [Topic Title]
*Issue: {ISSUE_ID}*
*Date: {TODAY}*
*Research: thoughts/{ISSUE_ID}/research.md*

## Overview
High-level implementation strategy based on research findings

## Success Criteria
### Automated Verification
- [ ] All tests pass
- [ ] No lint/build/type errors
- [ ] Performance benchmarks met

### Manual Verification
- [ ] Feature works as expected
- [ ] User experience validated
- [ ] No regressions introduced

## Implementation Phases

### Phase 1: [Phase Name]
**Goal**: [Clear objective]

**Tasks**:
- [ ] Task 1: [Atomic action with specific file:line if applicable]
- [ ] Task 2: [Each task executable with single Claude prompt]
- [ ] Task 3: [Clear success criteria for each task]

**Verification**:
- How to test this phase
- Expected outcomes

### Phase 2: [Phase Name]
**Goal**: [Clear objective]

**Tasks**:
- [ ] Task 4: [Dependencies clearly noted]
- [ ] Task 5: [No ambiguous instructions]
- [ ] Task 6: [Single command/edit per task]

**Verification**:
- Testing approach
- Success criteria

## Testing Strategy
- Unit tests to write/modify
- Integration testing approach
- Manual testing procedures

## Risk Mitigation
- Potential issues and solutions
- Rollback procedures
- Backup approaches

## File Changes Summary
- `file1.js:123` - [Description of changes]
- `file2.py:45` - [What will be modified]
- `newfile.ts` - [New file to create]

## Dependencies
- External services required
- Internal components affected
- Configuration changes needed
```

## Phase 3: AI Validation Loop

Spawn a validation Task agent with this prompt:

```
Validate the implementation plan at thoughts/{ISSUE_ID}/plan.md using FARR criteria:

**FACTUAL**: Is all information accurate and based on research? (0-5)
**ACTIONABLE**: Are all tasks atomic and executable? (0-5)
**RELIABLE**: Is the plan consistent and complete? (0-5)
**RELEVANT**: Does this plan address the research requirements? (0-5)

Score each criteria 0-5 and provide average. Minimum 4.0 to pass.

Requirements check:
- [ ] All tasks are atomic (single command/edit each)
- [ ] No ambiguous instructions
- [ ] Specific file references included where applicable
- [ ] Clear success criteria for each phase
- [ ] Testing strategy defined
- [ ] Dependencies clearly identified

Task atomicity check:
- Each task should be completable with one Claude Code prompt
- No task should require multiple decisions or approaches
- Each task has clear input/output expectations

Output format:
SCORES: F=X/5, A=X/5, R=X/5, R=X/5 | Average: X.X/5
STATUS: [PASS/FAIL]
ISSUES: [List any problems]
RECOMMENDATIONS: [Specific improvements needed]

Write validation results to thoughts/{ISSUE_ID}/plan-validation.md
```

**Validation Loop Logic:**
- If validation score ≥ 4.0: Proceed to handoff
- If validation score < 4.0: Refine plan based on feedback
- Maximum 3 plan → validation cycles
- If still failing after 3 attempts, note limitations and proceed

## Phase 4: Human Handoff

When plan passes validation, output:

```
✅ PLAN PHASE COMPLETE

Implementation plan: thoughts/{ISSUE_ID}/plan.md
Validation score: {SCORE}/5
Total tasks: {TASK_COUNT}

Next step: Review the implementation plan and run the following command when ready:

claude -p "/implement {ISSUE_ID}"

The implementation phase will execute each task and track progress until completion.
```

## Key Planning Principles

### Atomic Tasks
- Each task = one Claude Code prompt
- No multi-step decisions in single task
- Clear input and expected output
- Specific file modifications noted

### Example Good Tasks:
- ✅ "Create UserAuth component in `src/components/UserAuth.tsx` with email/password props"
- ✅ "Add validation middleware to `src/routes/api.js:45` using joi schema"
- ✅ "Write unit tests for UserAuth component covering valid/invalid inputs"

### Example Bad Tasks:
- ❌ "Implement user authentication" (too broad)
- ❌ "Fix the login system" (ambiguous)
- ❌ "Add error handling and validation" (multiple concerns)

## Important Guidelines

- **Read research completely** before planning
- **Make tasks atomic** - one prompt each
- **Include specific file references** - use `file:line` format
- **Define clear success criteria** for each phase
- **Plan for testing** at each phase
- **Maximum 3 validation cycles** to avoid infinite loops
- **End session after handoff** - let human review before implementation

The goal is to produce an implementation plan so clear that execution becomes mechanical.