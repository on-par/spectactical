# Claude Code Planning Prompt Template

## PLANNING PHASE: {{topic}}

Based on this validated research: 

```
{{researchContent}}
```

Create a detailed implementation plan with atomic tasks that transforms this research into executable work.

**CRITICAL REQUIREMENTS**:

### Task Atomicity
Each task must be:
- ✅ **Completable by a single Claude Code command** (create file, edit file, CLI operation)
- ✅ **Clearly defined** with no ambiguity about what to do
- ✅ **Independently executable** with minimal dependencies
- ✅ **Testable and verifiable** with specific validation criteria

### Context Budget Management
- 🎯 **Target**: Keep context utilization under 40% throughout implementation
- 📊 **Current**: {{currentContext}}% (from research handoff)
- 🔄 **Strategy**: Plan for context compaction between phases

### Implementation Strategy
Break the work into 3 phases:
1. **Foundation Phase**: Core infrastructure and building blocks
2. **Integration Phase**: Connect components and implement main functionality  
3. **Validation Phase**: Testing, monitoring, and production readiness

---

## Use this exact template structure:

```markdown
# Implementation Plan: {{topic}}
*Generated: {{timestamp}} | Phase: Planning | Session: {{sessionId}}*
*Based on Research: `{{researchFile}}`*

## 📋 Implementation Strategy

### Context Budget Management
- **Context Target**: < 40% utilization throughout implementation
- **Current Budget**: {{currentContext}}% (from research handoff)
- **Monitoring Strategy**: Update at each checkpoint

### Overall Approach
[High-level implementation strategy based on research]

---

## 🚧 Implementation Phases

### Phase 1: Foundation
**Estimated Context: [X]% | Files: [N]**

#### Tasks
- [ ] **Task 1**: `path/to/file.ext:line` - [modification description]
  - **Why**: [reason for this change]
  - **What**: [specific change to make]
  - **Test**: [how to verify this works]
  - **Validation**: [success criteria]
  - **Context Impact**: [estimated context usage]

- [ ] **Task 2**: `path/to/file.ext:line` - [modification description]
  - **Why**: [reason for this change]
  - **What**: [specific change to make]
  - **Test**: [how to verify this works]
  - **Validation**: [success criteria]
  - **Context Impact**: [estimated context usage]

#### Phase 1 Completion Criteria
- [ ] All foundation tasks completed
- [ ] Unit tests passing
- [ ] No breaking changes to existing functionality
- [ ] Context budget maintained under target

---

### Phase 2: Core Implementation
**Estimated Context: [X]% | Files: [N]**

#### Tasks
- [ ] **Task 3**: `path/to/file.ext:line` - [modification description]
  - **Why**: [reason for this change]
  - **What**: [specific change to make]
  - **Test**: [how to verify this works]
  - **Validation**: [success criteria]
  - **Context Impact**: [estimated context usage]
  - **Dependencies**: [depends on Phase 1 Task X]

#### Phase 2 Completion Criteria
- [ ] Core functionality implemented
- [ ] Integration tests passing
- [ ] Performance requirements met
- [ ] Error handling in place

---

### Phase 3: Integration & Validation
**Estimated Context: [X]% | Files: [N]**

#### Tasks
- [ ] **Task 4**: `path/to/file.ext` - [integration task]
  - **Why**: [reason for this change]
  - **What**: [specific integration to complete]
  - **Test**: [end-to-end testing approach]
  - **Validation**: [success criteria]

#### Phase 3 Completion Criteria
- [ ] All research success criteria met
- [ ] End-to-end tests passing
- [ ] Performance validated under load
- [ ] Documentation updated

---

## 🔄 Context Management Strategy

### Context Handoffs
- **After Phase 1**: Compact progress, start fresh context for Phase 2
- **After Phase 2**: Compact integration results, fresh context for Phase 3
- **After Phase 3**: Final validation and completion documentation

### Information Preservation
What to carry forward in compacted context:
- [ ] Current implementation status
- [ ] Any deviations from plan
- [ ] Performance metrics
- [ ] Test results
- [ ] Outstanding issues or blockers

---

## ⚠️ Risk Management

### Technical Risks
- **Risk 1**: [potential technical issue]
  - **Likelihood**: High/Medium/Low
  - **Impact**: High/Medium/Low  
  - **Mitigation**: [how to prevent/handle]

### Mitigation Strategies
- **Backup Plan**: [how to revert if needed]
- **Feature Flags**: [gradual rollout strategy]
- **Monitoring**: [what to watch during deployment]
- **Rollback Process**: [step-by-step rollback procedure]

---

## 📊 Plan Quality Checklist
**Validation criteria for this plan:**

- [ ] All research requirements addressed
- [ ] Tasks are atomic (completable by single command)
- [ ] Each task has clear validation criteria
- [ ] Context budget stays under 40% throughout
- [ ] Dependencies between tasks clearly identified
- [ ] Testing strategy included for every change
- [ ] Risk mitigation strategies defined
- [ ] Rollback procedures documented

---

## 🎯 Success Mapping
**Traceability from research to implementation:**

| Research Requirement | Implementation Tasks | Validation Method |
|---------------------|---------------------|-------------------|
| [Requirement 1] | [Task X, Task Y] | [How we'll verify] |
| [Requirement 2] | [Task Z] | [How we'll verify] |

---
**Plan Status**: Draft | Under Review | Validated | Complete
**Context Utilization**: [X]%
**Previous Phase**: Research → `{{researchFile}}`
**Next Phase**: Implementation
**Validation Notes**: [Add reviewer feedback here]
```

---

## Planning Guidelines:

### Task Creation Rules:
1. **Atomic**: Each task = one Claude Code session
2. **Specific**: Include exact file paths and line numbers
3. **Testable**: Clear validation criteria for each task
4. **Sequenced**: Dependencies explicitly identified
5. **Budgeted**: Context impact estimated for each task

### Context Budget Guidelines:
- **Phase 1 (Foundation)**: Typically 20-30% context
- **Phase 2 (Core Implementation)**: Typically 25-35% context  
- **Phase 3 (Integration/Validation)**: Typically 15-25% context
- **Always stay under 40% total**

### What Makes a Good Task:
✅ **Good**: "Update `src/routes/api.js:45` to add rate limiting middleware before auth middleware"
❌ **Bad**: "Add rate limiting to the API"

✅ **Good**: "Create `src/utils/rateLimiter.js` with sliding window algorithm class"
❌ **Bad**: "Implement rate limiting logic"

### Required Task Components:
- **Why**: Business/technical reason for the change
- **What**: Specific change to make
- **Test**: How to verify it works
- **Validation**: Success criteria
- **Context Impact**: Estimated context usage
- **Dependencies**: What must be complete first

### Success Mapping:
- Every research requirement must map to specific implementation tasks
- Every task must have a clear validation method
- No research requirement should be left unaddressed

---

## Context Management:

### Monitor Context Usage:
- Track context utilization as you plan
- Estimate context impact for each task
- Plan compaction points between phases

### Phase Transitions:
- **Phase 1 → 2**: Compact foundation progress, preserve key decisions
- **Phase 2 → 3**: Compact implementation status, preserve integration results
- **Phase 3 → Complete**: Final documentation and handoff

### Information to Preserve:
- Implementation decisions and rationale
- Test results and performance metrics
- Any deviations from original plan
- Outstanding issues or blockers
- Configuration choices and their reasons

---

**Next Steps**: After completing the plan, save to `02-plan.md` and run `/rpi plan validate` to check atomicity and coverage before moving to implementation phase.