# RPI Loop Tool: Complete Design Specification

## Vision Statement
A **Claude Code-native tooling system** that transforms AI-assisted development from "vibe coding" to systematic, specification-driven workflows using the proven Research→Plan→Implement methodology.

## Core Architecture

### Node.js + Claude Code Integration
```
rpi-loop/
├── package.json              # Node.js tooling
├── templates/                 # Phase templates
│   ├── research.md
│   ├── planning.md
│   └── implementation.md
├── prompts/                   # Battle-tested prompts
│   ├── research-prompt.md
│   ├── planning-prompt.md
│   └── implementation-prompt.md
├── scripts/                   # Workflow automation
│   ├── rpi-init.js
│   ├── context-monitor.js
│   └── phase-transition.js
└── examples/                  # Sample workflows
    └── user-auth-feature/
```

## Slash Commands for Claude Code

### Core Commands
```bash
/rpi init [topic]                    # Initialize new RPI workflow
/rpi research start [topic]          # Begin research phase
/rpi research validate              # Validate research completeness
/rpi plan start                     # Generate implementation plan
/rpi plan validate                  # Validate plan atomicity/coverage
/rpi implement start                # Execute implementation
/rpi implement checkpoint           # Create context checkpoint
/rpi status                         # Show current phase and progress
/rpi context                        # Check context utilization
```

### Advanced Commands
```bash
/rpi compact                        # Intentional context compaction
/rpi handoff                        # Prepare phase transition
/rpi validate-spec                  # Check spec compliance
/rpi team-sync                      # Generate team review documents
```

## File Structure Convention

### Project Integration
```
your-project/
├── .rpi/                          # RPI working directory
│   ├── config.json               # Project settings
│   ├── current-phase.json        # Phase tracking
│   └── context-budget.json       # Context monitoring
├── rpi-sessions/                  # Session outputs
│   └── [session-id]/
│       ├── 01-research.md        # Research phase output
│       ├── 02-plan.md            # Planning phase output
│       ├── 03-progress.md        # Implementation tracking
│       └── 04-completion.md      # Final deliverable
└── [your existing project files]
```

## Phase Templates

### Research Template Structure
```markdown
# Research: [TOPIC]
*Generated: [timestamp] | Phase: Research | Context Budget: 0%*

## 🎯 Problem Statement
**What are we solving?**
- Core problem: 
- Business impact:
- User pain point:

## 🏗️ System Understanding  
**How does the current system work?**
- Key files: `path/file.ext:123-145`
- Data flow: Component A → Component B → Component C
- Interfaces: [list key APIs/contracts]
- Dependencies: [external services, databases, etc.]

## 📍 Problem Location
**Where is the issue/feature located?**
- Primary files: `src/auth.js:89-104`, `lib/session.py:156`
- Related components: [list affected areas]
- Integration points: [where this touches other systems]

## ⚖️ Constraints & Requirements
**What are our limitations?**
- Technical: [performance, compatibility, etc.]
- Business: [timeline, budget, compliance]
- Team: [skills, availability, etc.]

## ✅ Success Criteria
**How do we know we're done?**
- [ ] Functional requirement 1
- [ ] Performance requirement 2  
- [ ] Quality requirement 3

## ❓ Open Questions
**What needs clarification?**
- [ ] Question about approach X
- [ ] Uncertainty about constraint Y
- [ ] Need input on decision Z

---
**Phase Status**: Draft | Validated | Complete
**Context Utilization**: [percentage]
**Next Phase**: Planning
```

### Planning Template Structure  
```markdown
# Plan: [TOPIC]
*Generated: [timestamp] | Phase: Planning | Context Budget: 35%*

## 📋 Implementation Strategy
**Based on research: `01-research.md`**

### Context Budget Management
- **Target**: Stay under 40% utilization
- **Current**: 35% (research handoff)
- **Monitoring**: Update at each checkpoint

## 🚧 Implementation Phases

### Phase 1: Foundation
**Context Budget: 25% | Files: 3**
- [ ] `src/auth/session.js:89` - Add mutex for cleanup
  - **Why**: Fix race condition in session cleanup
  - **Test**: Unit test with concurrent cleanup calls
  - **Validation**: No memory leaks in 1000 iterations

- [ ] `src/auth/types.ts:12` - Add cleanup state enum  
  - **Why**: Track cleanup lifecycle states
  - **Test**: Type checking in build process
  - **Validation**: Enum values used correctly

### Phase 2: Integration  
**Context Budget: 30% | Files: 2**
- [ ] `src/services/auth.js:156` - Use new session cleanup
  - **Why**: Integrate cleanup with service layer
  - **Test**: Integration test with full auth flow
  - **Validation**: < 50ms response time maintained

- [ ] `src/handlers/session.js:78` - Add error handling
  - **Why**: Graceful failure for cleanup errors  
  - **Test**: Error simulation and recovery
  - **Validation**: No 500 errors under failure conditions

### Phase 3: Validation
**Context Budget: 20% | Files: 1**
- [ ] `tests/load-test.js` - 1000 concurrent operations
  - **Why**: Verify performance under load
  - **Test**: Load test with monitoring
  - **Validation**: 99.9% success rate, stable memory

## 🔄 Context Handoff Strategy
- **After Phase 1**: Compact to progress file, fresh context
- **After Phase 2**: Update with integration results
- **After Phase 3**: Final validation and completion

## ⚠️ Risk Mitigation
- **Backup strategy**: Git branch before changes
- **Feature flags**: Gradual rollout capability  
- **Rollback plan**: Revert process documented
- **Monitoring**: Performance metrics during deployment

## 📊 Validation Criteria
- [ ] All research requirements addressed
- [ ] Tasks are atomic (single Claude Code command)
- [ ] Context budget maintained under 40%
- [ ] Testing strategy included for each task
- [ ] Dependencies clearly identified

---
**Phase Status**: Draft | Validated | Complete
**Context Utilization**: [percentage]
**Previous Phase**: Research → `01-research.md`
**Next Phase**: Implementation
```

### Implementation Template Structure
```markdown
# Implementation Progress: [TOPIC]
*Generated: [timestamp] | Phase: Implementation | Context Budget: 38%*

## 📊 Status Overview
- **Current Phase**: 2/3 (Integration)
- **Context Utilization**: 38% ✅ (under 40% target)
- **Plan Reference**: `02-plan.md`

## ✅ Completed Phases
### Phase 1: Foundation - COMPLETE
- [x] Added mutex to session cleanup (`src/auth/session.js:89`)
- [x] Created cleanup state enum (`src/auth/types.ts:12`)
- [x] Unit tests passing (`tests/auth/session.test.js:234`)
- **Result**: Race condition eliminated, tests pass

## 🔄 Current Phase: Integration - IN PROGRESS  
### Active Task
- [ ] Update `src/services/auth.js:156` - Use new session cleanup
  - **Progress**: 70% complete
  - **Status**: Modified GetSession() method, added state checking
  - **Next**: Complete error handling integration
  - **Context Impact**: +5% (now at 38%)

### Remaining Phase 2 Tasks
- [ ] Add error handling (`src/handlers/session.js:78`)

## ⏳ Pending Phases
### Phase 3: Validation - PENDING
- Load testing and final validation
- Estimated context: 20%

## 🎯 Context Management
### Current Context Breakdown
- Research context: 15% (compacted)
- Plan context: 10% (compacted)  
- Implementation context: 13%
- **Total**: 38% ✅

### Next Context Handoff
**Trigger**: When Phase 2 complete
**Action**: Compact progress, start fresh context for Phase 3
**Include**: Test results, any plan deviations, performance metrics

## 🚨 Issues & Deviations
- **None currently** - implementation following plan exactly
- **Performance**: Response times staying under 45ms (target: 50ms)

## 📈 Quality Metrics
- **Tests**: 100% passing
- **Coverage**: 95% (target: 90%)
- **Performance**: 45ms avg (target: <50ms)
- **Memory**: Stable (no leaks detected)

---
**Phase Status**: In Progress
**Context Utilization**: 38%
**Previous Phase**: Planning → `02-plan.md`
**Next Checkpoint**: Phase 2 completion
```

## Integration Workflow

### 1. Session Initialization
```javascript
// RPI workflow starts in Claude Code
/rpi init "user authentication system"

// Creates:
// - .rpi/config.json
// - rpi-sessions/session-001/
// - Loads research template
```

### 2. Research Phase
```javascript
/rpi research start "user authentication system"

// Claude Code receives:
// - Research template with prompts
// - Subagent instructions for codebase exploration  
// - Context budget monitoring
// - Validation checklist
```

### 3. Planning Phase
```javascript
/rpi plan start

// Takes validated research.md as input
// Generates atomic implementation plan
// Validates against context budget constraints
// Creates phase-by-phase breakdown
```

### 4. Implementation Phase
```javascript
/rpi implement start

// Executes plan systematically
// Updates progress.md in real-time
// Monitors context utilization
// Triggers checkpoints automatically
```

## Context Monitoring System

### Automatic Tracking
```javascript
// context-monitor.js
class ContextMonitor {
  track(phase, content) {
    const utilization = calculateTokens(content) / MAX_CONTEXT;
    if (utilization > 0.4) {
      triggerCompaction();
    }
    updatePhaseTracking(phase, utilization);
  }
}
```

### Compaction Triggers
- **Automatic**: When approaching 40% utilization
- **Manual**: `/rpi compact` command
- **Phase transition**: Automatic handoff between R→P→I

## Team Integration Features

### Review Documents
- **Research Review**: 200-line research vs 2000-line PR
- **Plan Review**: Structured implementation strategy
- **Progress Tracking**: Real-time implementation status

### Collaboration Workflow
```bash
/rpi team-sync        # Generate review documents
/rpi share-session    # Export session for team member
/rpi merge-feedback   # Incorporate team input
```

## Success Metrics

### Individual Developer
- **Context efficiency**: Maintain <40% utilization
- **Quality**: Fewer implementation surprises
- **Speed**: Faster development cycles
- **Alignment**: Clear problem understanding before coding

### Team Benefits  
- **Communication**: Spec review vs code review
- **Onboarding**: New team members understand system through research docs
- **Knowledge transfer**: Research/plans become living documentation
- **Risk reduction**: Catch problems early in research/planning phases

This tool transforms Claude Code from an ad-hoc coding assistant into a **systematic development methodology** with proven results on large, complex codebases.