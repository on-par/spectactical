# Claude Code Implementation Prompt Template

## IMPLEMENTATION PHASE: {{topic}}

Executing this validated implementation plan:

```
{{planContent}}
```

**CURRENT TASK**: {{currentTask}}

**CONTEXT STATUS**: {{contextUtilization}}% (Target: <40%)

---

## Implementation Guidelines:

### Current Task Details:
- **Task**: {{taskDescription}}
- **File**: {{targetFile}}
- **Why**: {{taskReason}}
- **What**: {{taskSpecifics}}
- **Test**: {{testingApproach}}
- **Validation**: {{successCriteria}}

### Context Management:
- 🎯 **Stay under 40% context utilization**
- 📊 **Current usage**: {{contextUtilization}}%
- ⚠️ **Alert threshold**: 35% (suggest compaction)
- 🔄 **Next checkpoint**: {{nextCheckpoint}}

### Implementation Standards:
- ✅ Follow existing code patterns and conventions
- ✅ Include proper error handling
- ✅ Add appropriate logging where needed
- ✅ Write tests that validate the success criteria
- ✅ Maintain backward compatibility unless explicitly planned otherwise

---

## Progress Tracking Template:

Update this template as you work:

```markdown
# Implementation Progress: {{topic}}
*Updated: {{timestamp}} | Phase: Implementation | Session: {{sessionId}}*

## 📊 Current Status
- **Current Phase**: {{currentPhaseNumber}}/{{totalPhases}} ({{phaseName}})
- **Overall Progress**: {{overallProgress}}%
- **Context Utilization**: {{contextUtilization}}% {{statusIndicator}}
- **Active Task**: {{currentTask}}

## 🔄 Active Task: {{currentTask}}
- **Progress**: {{taskProgress}}%
- **Status**: {{detailedStatus}}
- **Next Step**: {{nextStep}}
- **Context Impact**: {{contextDelta}}%

## ✅ Completed in This Session
- [x] **{{completedTask1}}** - {{result1}}
- [x] **{{completedTask2}}** - {{result2}}

## 🎯 Quality Metrics
### Test Status
- **Unit Tests**: {{unitTestStatus}}
- **Integration Tests**: {{integrationTestStatus}}
- **Coverage**: {{coveragePercentage}}%

### Performance Metrics
- **Response Time**: {{responseTime}}ms (target: {{targetResponse}}ms)
- **Memory Usage**: {{memoryUsage}}
- **Error Rate**: {{errorRate}}%

## 🚨 Issues & Deviations
{{#if currentIssues}}
- **Issue**: {{issueDescription}}
  - **Impact**: {{issueImpact}}
  - **Resolution**: {{resolutionPlan}}
{{else}}
- **No current issues** ✅
{{/if}}

## 🔄 Context Management
- **Research Context**: {{researchContext}}% (compacted)
- **Plan Context**: {{planContext}}% (compacted)
- **Implementation Context**: {{implementationContext}}%
- **Total**: {{totalContext}}%

{{#if approachingLimit}}
⚠️ **Action Required**: Context approaching limit
- **Recommendation**: {{compactionRecommendation}}
- **Preserve**: {{preservationList}}
{{/if}}

## 🎯 Next Actions
1. {{nextAction1}}
2. {{nextAction2}}
3. {{nextAction3}}

---
**Status**: {{implementationStatus}}
**Context**: {{contextUtilization}}%
**Next Milestone**: {{nextMilestone}}
```

---

## Task Execution Process:

### 1. Before Starting Task:
- [ ] Read the current implementation plan
- [ ] Understand the specific task requirements
- [ ] Check dependencies are complete
- [ ] Verify context budget available

### 2. During Task Execution:
- [ ] Follow the task specifications exactly
- [ ] Write tests as you implement
- [ ] Update progress tracking regularly
- [ ] Monitor context utilization

### 3. After Task Completion:
- [ ] Run tests to verify success criteria
- [ ] Update implementation progress file
- [ ] Check if context compaction needed
- [ ] Prepare for next task or phase transition

### 4. Phase Completion:
- [ ] All phase tasks completed
- [ ] All tests passing
- [ ] Performance criteria met
- [ ] Documentation updated
- [ ] Ready for context compaction and next phase

---

## Context Management Rules:

### When to Compact (Any of these):
- ✅ Context utilization reaches 35%
- ✅ Phase transition time
- ✅ Context becomes unfocused or polluted
- ✅ Implementation deviates significantly from plan

### What to Preserve in Compaction:
- ✅ Current task progress and status
- ✅ Completed tasks with results
- ✅ Any plan deviations and reasons
- ✅ Performance metrics and test results
- ✅ Outstanding issues or blockers
- ✅ Key technical decisions made

### Fresh Context Handoff:
```markdown
# Implementation Context Handoff: {{topic}}

## Completed Work
- **Phase**: {{completedPhase}}
- **Tasks Completed**: {{completedTasksList}}
- **Test Status**: {{testStatus}}
- **Performance**: {{performanceResults}}

## Current Status
- **Active Task**: {{currentTask}}
- **Progress**: {{taskProgress}}%
- **Next Steps**: {{nextSteps}}

## Technical Decisions
- **Decision 1**: {{decision1}} - Reason: {{reason1}}
- **Decision 2**: {{decision2}} - Reason: {{reason2}}

## Issues/Deviations
- **Issue/Deviation**: {{issueDescription}}
- **Impact**: {{impact}}
- **Resolution**: {{resolution}}

## Performance Metrics
- **Response Time**: {{responseTime}}ms
- **Memory Usage**: {{memoryUsage}}
- **Test Coverage**: {{coverage}}%

## Next Phase Requirements
- **Dependencies**: {{dependencies}}
- **Context Budget**: {{availableBudget}}%
- **Key Tasks**: {{upcomingTasks}}
```

---

## Quality Standards:

### Code Quality:
- ✅ Follow existing patterns and conventions
- ✅ Include comprehensive error handling
- ✅ Add appropriate logging and monitoring
- ✅ Maintain security best practices
- ✅ Optimize for performance requirements

### Testing Requirements:
- ✅ Unit tests for all new functionality
- ✅ Integration tests for component interactions
- ✅ Performance tests for critical paths
- ✅ Error handling tests for failure scenarios
- ✅ Security tests for sensitive operations

### Documentation:
- ✅ Update inline code comments
- ✅ Update API documentation if needed
- ✅ Update configuration documentation
- ✅ Update deployment/operational docs

---

## Emergency Procedures:

### If Context Pollution Occurs:
1. **Stop current work**
2. **Identify what caused the pollution**
3. **Run immediate compaction**
4. **Start fresh context with handoff document**
5. **Continue with current task**

### If Task Blocks or Fails:
1. **Document the blocker clearly**
2. **Assess impact on overall plan**
3. **Create alternative approach if needed**
4. **Update plan with new timeline**
5. **Continue with next available task**

### If Performance Issues:
1. **Document specific performance problem**
2. **Measure actual vs target metrics**
3. **Identify root cause**
4. **Implement performance fix**
5. **Re-validate performance criteria**

---

**Remember**: Implementation phase is about systematic execution of the validated plan. Stay focused on the current task, maintain context efficiency, and validate each step before moving forward.

**Next Steps**: Execute the current task following the specifications, update progress tracking, and prepare for the next task or phase transition.