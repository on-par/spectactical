# Implement Phase Command

This command executes a validated implementation plan, validates the implementation using AI agents, and completes the development cycle.

## Usage
```bash
claude -p "/implement ISSUE-123"
```

## Process Overview

1. **Load Plan**: Read and understand the validated implementation plan
2. **Execute Tasks**: Work through each atomic task systematically
3. **Track Progress**: Update implementation document with progress
4. **Validate Implementation**: Run tests, check quality, validate completion
5. **AI Validation Loop**: Spawn validation agent to verify completion (up to 3 iterations)
6. **Complete**: Confirm all tasks done and tests passing

## Phase 1: Plan Analysis

**Read the plan document completely:**
- `thoughts/{ISSUE_ID}/plan.md`
- Understand all phases and tasks
- Note dependencies between tasks
- Review success criteria

**Create initial progress tracking:**
- Copy plan tasks to `thoughts/{ISSUE_ID}/implementation.md`
- Set up progress tracking structure

## Phase 2: Implementation Execution

Create `thoughts/{ISSUE_ID}/implementation.md` with:

```markdown
# Implementation Progress: [Topic Title]
*Issue: {ISSUE_ID}*
*Date: {TODAY}*
*Plan: thoughts/{ISSUE_ID}/plan.md*

## Status Summary
- **Started**: {DATE}
- **Current Phase**: [Phase Name]
- **Completed Tasks**: X of Y
- **Tests Status**: [Passing/Failing/Not Run]
- **Build Status**: [Success/Failing/Not Run]

## Phase 1: [Phase Name]
### Goal: [Phase objective]

- [x] ✅ Task 1: [Description] - *Completed: {TIMESTAMP}*
  - **Notes**: Implementation details, any deviations from plan
  - **Files Modified**: `file1.js`, `file2.py`
  - **Tests**: Added unit tests for X, Y

- [ ] 🔄 Task 2: [Description] - *In Progress*
  - **Current Approach**: What you're doing
  - **Blockers**: Any issues encountered

- [ ] ⬜ Task 3: [Description] - *Pending*

### Phase Verification:
- [ ] Automated tests pass
- [ ] Manual testing complete
- [ ] No regressions

## Phase 2: [Phase Name]
[Continue with remaining phases...]

## Quality Checks
- [ ] All tests passing
- [ ] No lint errors
- [ ] No build errors  
- [ ] No type check errors
- [ ] Performance acceptable
- [ ] No regressions introduced

## Final Verification
- [ ] All plan tasks completed
- [ ] Success criteria met
- [ ] Implementation validated
```

### Task Execution Process:

For each task in the plan:

1. **Read task carefully** - understand exactly what needs to be done
2. **Execute the task** - make the specific change/addition
3. **Test immediately** - run relevant tests for that change
4. **Update progress** - mark task complete with notes
5. **Move to next task**

### Quality Gates:

After each phase:
- Run all tests: `npm test` / `pytest` / `cargo test` (if they exist)
- Check build: `npm run build` / `make build` (if process exists)  
- Check linting: `npm run lint` / `pylint` / `cargo clippy` (if configured)
- Check types: `npm run type-check` / `mypy` / `tsc --noEmit` (if configured)

**Do not proceed to next phase if quality gates fail.**

## Phase 3: AI Validation Loop

When all tasks appear complete, spawn a validation Task agent with this prompt:

```
Validate the implementation at thoughts/{ISSUE_ID}/implementation.md using FARR criteria:

**FACTUAL**: Is the implementation actually complete and accurate? (0-5)
**ACTIONABLE**: Does the implementation work as intended? (0-5)
**RELIABLE**: Are all tests passing and quality checks satisfied? (0-5) 
**RELEVANT**: Does this implementation satisfy the original plan? (0-5)

Score each criteria 0-5 and provide average. Minimum 4.0 to pass.

Implementation completeness check:
- [ ] All plan tasks marked as completed
- [ ] All tests passing (run test commands)
- [ ] No lint/build/type errors (run quality commands)
- [ ] No regressions (verify existing functionality)
- [ ] Success criteria from plan satisfied

Quality verification:
- Run existing test suites if they exist
- Check for build/lint/type errors if tooling exists
- Verify no existing functionality is broken

Output format:
SCORES: F=X/5, A=X/5, R=X/5, R=X/5 | Average: X.X/5
STATUS: [PASS/FAIL] 
ISSUES: [List any problems]
TEST_RESULTS: [Summary of test runs]
QUALITY_CHECKS: [Lint/build/type status]

Write validation results to thoughts/{ISSUE_ID}/implementation-validation.md
```

**Validation Loop Logic:**
- If validation score ≥ 4.0 AND all tests pass: Complete
- If validation score < 4.0 OR tests fail: Fix issues and re-validate
- Maximum 3 implementation → validation cycles
- If still failing after 3 attempts, document blockers and ask for guidance

## Phase 4: Completion

When implementation passes validation, output:

```
🎉 IMPLEMENTATION PHASE COMPLETE

Implementation: thoughts/{ISSUE_ID}/implementation.md
Validation score: {SCORE}/5
Tasks completed: {COMPLETED}/{TOTAL}
Test status: ✅ All Passing
Build status: ✅ Success

✅ DELIVERABLE READY

The feature has been successfully implemented according to the plan.
All tests are passing and quality checks satisfied.

Summary:
- Research: thoughts/{ISSUE_ID}/research.md
- Plan: thoughts/{ISSUE_ID}/plan.md  
- Implementation: thoughts/{ISSUE_ID}/implementation.md

Total time: Research → Plan → Implement → Complete
```

## Error Handling

### When Tasks Can't Be Completed:
1. **Document the blocker** in implementation.md
2. **Try alternative approaches** from the plan's risk mitigation
3. **Ask for clarification** if plan is unclear
4. **Don't skip tasks** - mark as blocked instead

### When Tests Fail:
1. **Fix the failing tests** - don't ignore them
2. **Understand why they failed** - is it a regression?
3. **Update implementation** to pass tests
4. **Re-run validation** after fixes

### When Quality Checks Fail:
1. **Fix lint/build/type errors** - they must pass
2. **Don't comment out failing checks** - fix the root cause
3. **Ask for help** if errors are unclear
4. **Re-validate** after fixes

## Important Guidelines

- **Execute tasks in order** - respect dependencies
- **Test frequently** - after each task or phase
- **Update progress constantly** - maintain accurate status
- **Don't skip failing tests** - they must pass
- **Fix quality issues immediately** - don't accumulate debt
- **Maximum 3 validation cycles** - ask for help if stuck
- **Document all deviations** - note when plan doesn't match reality

The goal is to deliver working, tested, high-quality implementation that satisfies the original research requirements.