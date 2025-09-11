# RPI Loop: Complete Template Collection

## Research Phase Template

```markdown
# Research: {{TOPIC}}
*Generated: {{TIMESTAMP}} | Phase: Research | Session: {{SESSION_ID}}*

## 🎯 Problem Statement
**What are we solving?**

### Core Problem
[Describe the fundamental issue or feature need]

### Business Impact  
[Why this matters to the business/users]

### Current Pain Points
[What's broken or missing right now]

---

## 🏗️ System Understanding  
**How does the current system work?**

### Architecture Overview
[High-level system design]

### Key Components
- **Component 1**: `path/to/file.ext:line-range` - [purpose]
- **Component 2**: `path/to/file.ext:line-range` - [purpose]
- **Component 3**: `path/to/file.ext:line-range` - [purpose]

### Data Flow
```
[Request/Input] → [Component A] → [Component B] → [Component C] → [Output]
```

### Critical Interfaces
- **API/Interface 1**: [description, location]
- **API/Interface 2**: [description, location]

### Dependencies
- **External Services**: [list services this interacts with]
- **Databases**: [data stores involved]
- **Third-party APIs**: [external dependencies]

---

## 📍 Problem Location
**Where is the issue/feature located?**

### Primary Files
- `src/component/file.js:89-104` - [what happens here]
- `lib/service/handler.py:156-180` - [what happens here]

### Related Components  
- **Upstream**: [what feeds into this]
- **Downstream**: [what this affects]
- **Siblings**: [parallel components that might be affected]

### Integration Points
- **Database interactions**: [which tables/collections]
- **API endpoints**: [which routes affected]
- **External services**: [which integrations involved]

---

## ⚖️ Constraints & Requirements

### Technical Constraints
- **Performance**: [response time, throughput requirements]
- **Compatibility**: [backward compatibility needs]
- **Security**: [security requirements, compliance]
- **Scale**: [expected load, user count]

### Business Constraints
- **Timeline**: [delivery expectations]
- **Resources**: [team capacity, budget]
- **Compliance**: [regulatory requirements]

### Team Constraints  
- **Skills**: [team expertise areas]
- **Availability**: [capacity limitations]
- **Process**: [deployment, testing constraints]

---

## ✅ Success Criteria
**How do we know we're done?**

### Functional Requirements
- [ ] [Specific functional outcome 1]
- [ ] [Specific functional outcome 2]
- [ ] [Specific functional outcome 3]

### Performance Requirements
- [ ] [Performance metric 1: < X ms response time]
- [ ] [Performance metric 2: > Y requests/second]
- [ ] [Performance metric 3: < Z% error rate]

### Quality Requirements
- [ ] [Code coverage > X%]
- [ ] [No security vulnerabilities]
- [ ] [Documentation updated]

### Business Requirements
- [ ] [User satisfaction metric]
- [ ] [Business metric improvement]
- [ ] [Compliance requirement met]

---

## ❓ Open Questions
**What needs clarification before planning?**

### Technical Questions
- [ ] [Question about technical approach/architecture]
- [ ] [Uncertainty about performance implications]
- [ ] [Need clarity on integration approach]

### Business Questions
- [ ] [Question about requirements priority]
- [ ] [Need input on user experience approach]
- [ ] [Clarification needed on success metrics]

### Process Questions
- [ ] [Question about deployment strategy]
- [ ] [Testing approach needs definition]
- [ ] [Review process clarification needed]

---

## 📊 Research Quality Checklist
**Validation criteria for this research:**

- [ ] Problem clearly defined with business context
- [ ] System architecture understood with file:line specificity
- [ ] All dependencies and constraints identified
- [ ] Success criteria are measurable and testable
- [ ] All questions answered or marked for follow-up
- [ ] No implementation details included (stay at "what" level)

---
**Research Status**: Draft | Under Review | Validated | Complete
**Context Utilization**: [X]% 
**Next Phase**: Planning
**Validation Notes**: [Add reviewer feedback here]
```

## Planning Phase Template

```markdown
# Implementation Plan: {{TOPIC}}
*Generated: {{TIMESTAMP}} | Phase: Planning | Session: {{SESSION_ID}}*
*Based on Research: `{{RESEARCH_FILE}}`*

## 📋 Implementation Strategy

### Context Budget Management
- **Context Target**: < 40% utilization throughout implementation
- **Current Budget**: {{CURRENT_CONTEXT}}% (from research handoff)
- **Monitoring Strategy**: Update at each checkpoint

### Overall Approach
[High-level implementation strategy based on research]

---

## 🚧 Implementation Phases

### Phase 1: Foundation
**Estimated Context: {{PHASE1_CONTEXT}}% | Files: {{PHASE1_FILES}}**

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
**Estimated Context: {{PHASE2_CONTEXT}}% | Files: {{PHASE2_FILES}}**

#### Tasks
- [ ] **Task 3**: `path/to/file.ext:line` - [modification description]
  - **Why**: [reason for this change]
  - **What**: [specific change to make]
  - **Test**: [how to verify this works]
  - **Validation**: [success criteria]
  - **Context Impact**: [estimated context usage]
  - **Dependencies**: [depends on Phase 1 Task X]

- [ ] **Task 4**: `path/to/file.ext:line` - [modification description]
  - **Why**: [reason for this change]
  - **What**: [specific change to make]
  - **Test**: [how to verify this works]
  - **Validation**: [success criteria]
  - **Context Impact**: [estimated context usage]

#### Phase 2 Completion Criteria
- [ ] Core functionality implemented
- [ ] Integration tests passing
- [ ] Performance requirements met
- [ ] Error handling in place

---

### Phase 3: Integration & Validation
**Estimated Context: {{PHASE3_CONTEXT}}% | Files: {{PHASE3_FILES}}**

#### Tasks
- [ ] **Task 5**: `path/to/file.ext` - [integration task]
  - **Why**: [reason for this change]
  - **What**: [specific integration to complete]
  - **Test**: [end-to-end testing approach]
  - **Validation**: [success criteria]

- [ ] **Task 6**: Load testing and performance validation
  - **Why**: Ensure performance requirements met
  - **What**: Run comprehensive load tests
  - **Test**: [specific load testing approach]
  - **Validation**: [performance criteria from research]

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

### Compaction Points
- **Automatic**: When approaching 40% context utilization
- **Manual**: Between phases for optimal fresh start
- **Emergency**: If context becomes polluted or unfocused

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

- **Risk 2**: [potential technical issue]
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
| [Requirement 3] | [Task A, Task B] | [How we'll verify] |

---
**Plan Status**: Draft | Under Review | Validated | Complete
**Context Utilization**: [X]%
**Previous Phase**: Research → `{{RESEARCH_FILE}}`
**Next Phase**: Implementation
**Validation Notes**: [Add reviewer feedback here]
```

## Implementation Phase Template

```markdown
# Implementation Progress: {{TOPIC}}
*Generated: {{TIMESTAMP}} | Phase: Implementation | Session: {{SESSION_ID}}*
*Executing Plan: `{{PLAN_FILE}}`*

## 📊 Current Status

### Phase Overview
- **Current Phase**: {{CURRENT_PHASE}}/{{TOTAL_PHASES}} ({{PHASE_NAME}})
- **Overall Progress**: {{OVERALL_PROGRESS}}%
- **Context Utilization**: {{CONTEXT_USAGE}}% {{STATUS_INDICATOR}}
- **Session Time**: {{SESSION_DURATION}}

### Context Budget Status
- **Target**: < 40% utilization
- **Current**: {{CONTEXT_USAGE}}%
- **Trend**: {{TREND_INDICATOR}} (↑ increasing, ↓ decreasing, → stable)
- **Next Checkpoint**: {{NEXT_CHECKPOINT}}

---

## ✅ Completed Phases

### {{COMPLETED_PHASE_NAME}} - COMPLETE ✅
**Completed**: {{COMPLETION_TIMESTAMP}}

#### Completed Tasks
- [x] **{{TASK_NAME}}** (`{{FILE_PATH}}:{{LINE_RANGE}}`)
  - **Result**: {{TASK_RESULT}}
  - **Tests**: {{TEST_STATUS}}
  - **Performance**: {{PERFORMANCE_RESULT}}

- [x] **{{TASK_NAME}}** (`{{FILE_PATH}}:{{LINE_RANGE}}`)
  - **Result**: {{TASK_RESULT}}
  - **Tests**: {{TEST_STATUS}}
  - **Performance**: {{PERFORMANCE_RESULT}}

#### Phase Results
- **Functionality**: {{FUNCTIONAL_STATUS}}
- **Tests**: {{TEST_RESULTS}}
- **Performance**: {{PERFORMANCE_METRICS}}
- **Context Impact**: Used {{PHASE_CONTEXT}}% (planned: {{PLANNED_CONTEXT}}%)

---

## 🔄 Current Phase: {{CURRENT_PHASE_NAME}} - IN PROGRESS

### Active Task
- [ ] **{{ACTIVE_TASK}}** (`{{FILE_PATH}}:{{LINE_RANGE}}`)
  - **Progress**: {{TASK_PROGRESS}}%
  - **Current Status**: {{DETAILED_STATUS}}
  - **Next Step**: {{NEXT_STEP}}
  - **Context Impact**: +{{CONTEXT_DELTA}}% (total now {{CURRENT_CONTEXT}}%)
  - **Started**: {{START_TIME}}
  - **Estimated Completion**: {{ETA}}

### Task Details
**What we're doing**: {{TASK_DESCRIPTION}}
**Why it matters**: {{TASK_RATIONALE}}
**How we're testing**: {{TESTING_APPROACH}}

### Remaining Tasks in Current Phase
- [ ] **{{PENDING_TASK_1}}** - {{TASK_SUMMARY}}
- [ ] **{{PENDING_TASK_2}}** - {{TASK_SUMMARY}}

---

## ⏳ Pending Phases

### {{NEXT_PHASE_NAME}} - QUEUED
**Estimated Context**: {{ESTIMATED_CONTEXT}}%
**Key Tasks**: {{PHASE_SUMMARY}}

---

## 🎯 Quality Metrics (Real-time)

### Test Status
- **Unit Tests**: {{UNIT_TEST_STATUS}} ({{UNIT_TEST_COUNT}} tests)
- **Integration Tests**: {{INTEGRATION_TEST_STATUS}} ({{INTEGRATION_TEST_COUNT}} tests)
- **Coverage**: {{COVERAGE_PERCENTAGE}}% (target: {{TARGET_COVERAGE}}%)

### Performance Metrics
- **Response Time**: {{RESPONSE_TIME}}ms (target: <{{TARGET_RESPONSE}}ms)
- **Memory Usage**: {{MEMORY_USAGE}} (baseline: {{MEMORY_BASELINE}})
- **Error Rate**: {{ERROR_RATE}}% (target: <{{TARGET_ERROR_RATE}}%)

### Code Quality
- **Linting**: {{LINT_STATUS}}
- **Type Checking**: {{TYPE_CHECK_STATUS}}
- **Security Scan**: {{SECURITY_STATUS}}

---

## 🚨 Issues & Deviations

### Current Issues
{{#if CURRENT_ISSUES}}
- **Issue 1**: {{ISSUE_DESCRIPTION}}
  - **Impact**: {{ISSUE_IMPACT}}
  - **Status**: {{ISSUE_STATUS}}
  - **Resolution Plan**: {{RESOLUTION_PLAN}}
{{else}}
- **No current issues** ✅
{{/if}}

### Plan Deviations
{{#if PLAN_DEVIATIONS}}
- **Deviation 1**: {{DEVIATION_DESCRIPTION}}
  - **Reason**: {{DEVIATION_REASON}}
  - **Impact**: {{DEVIATION_IMPACT}}
  - **Adjustment**: {{PLAN_ADJUSTMENT}}
{{else}}
- **Implementation following plan exactly** ✅
{{/if}}

---

## 🔄 Context Management

### Current Context Breakdown
- **Research Context**: {{RESEARCH_CONTEXT}}% (compacted)
- **Plan Context**: {{PLAN_CONTEXT}}% (compacted)
- **Implementation Context**: {{IMPLEMENTATION_CONTEXT}}%
- **Working Memory**: {{WORKING_MEMORY}}%
- **Total**: {{TOTAL_CONTEXT}}%

### Next Context Action
{{#if APPROACHING_LIMIT}}
- **Action Required**: Context compaction needed
- **Trigger**: {{COMPACTION_TRIGGER}}
- **What to preserve**: {{PRESERVATION_STRATEGY}}
{{else}}
- **Status**: Context healthy, continue implementation
- **Next checkpoint**: {{NEXT_CHECKPOINT}}
{{/if}}

### Context Handoff Preparation
{{#if PHASE_TRANSITION_APPROACHING}}
- **Upcoming Transition**: To {{NEXT_PHASE}}
- **Handoff Requirements**: {{HANDOFF_REQUIREMENTS}}
- **Information to Carry Forward**: {{CARRY_FORWARD_INFO}}
{{/if}}

---

## 📈 Session Analytics

### Productivity Metrics
- **Tasks Completed**: {{COMPLETED_TASKS}}/{{TOTAL_TASKS}}
- **Time per Task**: {{AVG_TIME_PER_TASK}}
- **Context Efficiency**: {{CONTEXT_EFFICIENCY}}%
- **Plan Adherence**: {{PLAN_ADHERENCE}}%

### Learning & Insights
- **Key Learnings**: {{SESSION_LEARNINGS}}
- **Process Improvements**: {{PROCESS_IMPROVEMENTS}}
- **Team Notes**: {{TEAM_NOTES}}

---

## 🎯 Next Actions

### Immediate (Next 15 minutes)
1. {{IMMEDIATE_ACTION_1}}
2. {{IMMEDIATE_ACTION_2}}

### Short-term (This session)
1. {{SHORT_TERM_ACTION_1}}
2. {{SHORT_TERM_ACTION_2}}

### Medium-term (Next session)
1. {{MEDIUM_TERM_ACTION_1}}
2. {{MEDIUM_TERM_ACTION_2}}

---
**Implementation Status**: {{IMPLEMENTATION_STATUS}}
**Context Utilization**: {{CONTEXT_USAGE}}%
**Previous Phase**: Planning → `{{PLAN_FILE}}`
**Next Milestone**: {{NEXT_MILESTONE}}
**Last Updated**: {{LAST_UPDATE_TIME}}
```

These templates provide the complete structure for running the RPI Loop methodology with Claude Code, ensuring systematic progress tracking and context management throughout the development process.