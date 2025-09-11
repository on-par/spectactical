# RPI Loop CLI Tool - MVP Specification
*Simplified specification focused on core value delivery*

## Project Overview

**Name**: `rpi-loop`  
**Type**: Node.js CLI Tool  
**Purpose**: Generate better Claude Code prompts using Research → Plan → Implement methodology  
**Timeline**: 3 weeks to MVP  
**Complexity**: 32 implementation tasks (reduced from 158)

## Problem We're Solving

Developers using Claude Code face:
- Ad-hoc prompting that produces inconsistent results
- Context pollution from unstructured conversations
- Implementation surprises from poor planning
- No systematic approach to complex features

RPI Loop provides:
- Structured prompts that produce better AI responses
- Clear three-phase workflow (Research → Plan → Implement)
- Templates that capture the right information
- Simple tool that works immediately

## MVP Scope

### What We're Building
- ✅ Simple CLI with 5 commands (init, research, plan, implement, status)
- ✅ Basic templates for each phase
- ✅ Claude Code prompt generation with context handoff
- ✅ Simple file structure (./rpi/ directory)
- ✅ Zero configuration setup

### What We're NOT Building (Yet)
- ❌ Context monitoring and 40% tracking
- ❌ Complex session management
- ❌ Template customization
- ❌ Team collaboration features
- ❌ Advanced error recovery
- ❌ Performance optimization

## Technical Design (Simplified)

### Dependencies (Minimal)
```json
{
  "dependencies": {
    "commander": "^11.0.0",
    "fs-extra": "^11.0.0",
    "handlebars": "^4.7.0",
    "chalk": "^5.3.0"
  }
}
```

### File Structure (Simple)
```
rpi-loop/
├── bin/
│   └── rpi.js              # CLI entry point
├── lib/
│   ├── commands/           # Command handlers
│   │   ├── init.js
│   │   ├── research.js
│   │   ├── plan.js
│   │   ├── implement.js
│   │   └── status.js
│   ├── templates/          # Simple templates
│   │   ├── research.hbs
│   │   ├── plan.hbs
│   │   └── implement.hbs
│   └── utils/
│       └── fileManager.js  # Basic file operations
└── package.json
```

### User's Project Structure (Created by tool)
```
my-project/
├── rpi/                    # RPI working directory
│   ├── research.md         # Research output
│   ├── plan.md            # Planning output
│   ├── progress.md        # Implementation tracking
│   └── prompts/           # Claude Code prompts
│       ├── research.txt
│       ├── plan.txt
│       └── implement.txt
└── [existing project files]
```

## Command Specifications (MVP)

### `rpi init <topic>`
Creates ./rpi/ directory and initial files
```bash
rpi init "user authentication"
# Creates: ./rpi/research.md with template
# Creates: ./rpi/prompts/research.txt with Claude prompt
```

### `rpi research`
Generates research template and Claude Code prompt
```bash
rpi research
# Updates: ./rpi/prompts/research.txt
# Shows: Instructions to copy prompt to Claude Code
```

### `rpi plan`
Generates planning prompt with research context
```bash
rpi plan
# Reads: ./rpi/research.md
# Creates: ./rpi/prompts/plan.txt with research included
# Shows: Instructions for next step
```

### `rpi implement`
Generates implementation prompt with plan context
```bash
rpi implement
# Reads: ./rpi/plan.md
# Creates: ./rpi/prompts/implement.txt with plan included
# Shows: Progress tracking instructions
```

### `rpi status`
Shows current phase and next steps
```bash
rpi status
# Shows: Current phase (research/planning/implementation)
# Shows: Files created
# Shows: Next recommended action
```

## Templates (Simplified)

### Research Template
```markdown
# Research: {{topic}}

## Problem Statement
- What problem are we solving?
- Why does this matter?
- What's the current situation?

## System Understanding
- Key files involved: `file:line`
- How does it currently work?
- What needs to change?

## Requirements
- Functional requirements
- Technical constraints
- Success criteria

## Open Questions
- [ ] What needs clarification?
```

### Planning Template
```markdown
# Plan: {{topic}}

## Implementation Strategy
- Overall approach
- Key decisions made

## Phase 1: [Name]
- [ ] Task 1 (atomic, single command)
- [ ] Task 2 (atomic, single command)

## Phase 2: [Name]
- [ ] Task 3 (atomic, single command)
- [ ] Task 4 (atomic, single command)

## Testing Strategy
- How will we validate?

## Risk Mitigation
- What could go wrong?
- Backup plans
```

### Implementation Template
```markdown
# Implementation Progress: {{topic}}

## Current Status
- Phase: X of Y
- Progress: Z%
- Next task: [Description]

## Completed Tasks
- [x] Task 1 - Result
- [x] Task 2 - Result

## Active Task
- [ ] Current task in progress

## Notes
- Any deviations from plan
- Issues encountered
```

## Claude Code Prompts (Core Value)

### Research Prompt Structure
```
I need to research "{{topic}}" using the RPI methodology.

Focus only on understanding the problem without implementation details.

Use this template:
[Research template embedded]

Key instructions:
- Include specific file:line references
- Stay at high level (what/why, not how)
- Identify all constraints and requirements
```

### Planning Prompt Structure
```
Based on this research:
[Research content included]

Create an implementation plan with atomic tasks.

Use this template:
[Planning template embedded]

Requirements:
- Each task must be completable in one command
- Include testing for each phase
- Identify dependencies between tasks
```

### Implementation Prompt Structure
```
Based on this plan:
[Plan content included]

Help me implement Phase {{current_phase}}.

Current progress:
[Progress content included]

Focus on:
- Completing the current task
- Following the plan exactly
- Noting any deviations needed
```

## Success Criteria (MVP)

### Installation Success
- [ ] `npm install -g rpi-loop` works on Mac/Linux/Windows
- [ ] Installation completes in <30 seconds
- [ ] `rpi --help` works immediately

### Usage Success
- [ ] Complete RPI cycle works in <10 minutes
- [ ] Generated prompts improve Claude Code outputs
- [ ] No configuration required
- [ ] Clear error messages when things fail

### Adoption Success
- [ ] 10 developers complete successful RPI cycles
- [ ] 100+ GitHub stars in first month
- [ ] 5+ positive testimonials
- [ ] 0 critical bugs reported

## Implementation Timeline

### Week 1: Core Development
- Days 1-2: Project setup and basic CLI structure
- Days 3-4: All commands working with simple templates
- Day 5: Claude Code prompt generation

### Week 2: Polish and Testing
- Days 1-2: Improve prompts based on testing
- Days 3-4: User experience improvements
- Day 5: Beta testing with 5 developers

### Week 3: Launch Preparation
- Days 1-2: Fix issues from beta testing
- Day 3: Documentation and README
- Day 4: npm package preparation
- Day 5: Public launch

## Risk Mitigation

### Primary Risk: Prompt Quality
**Mitigation**: Test extensively with real Claude Code sessions

### Secondary Risk: Installation Issues
**Mitigation**: Test on clean systems across platforms

### Tertiary Risk: User Confusion
**Mitigation**: Clear examples and error messages

## What Success Looks Like

A developer says:
> "I installed rpi-loop in 30 seconds, ran through my first feature in 10 minutes, and Claude Code gave me significantly better responses. This actually helps!"

## MVP Philosophy

**Build less, but build it perfectly.**

Focus entirely on:
1. Flawless installation experience
2. Simple, intuitive workflow
3. High-quality Claude Code prompts
4. Clear value demonstration

Everything else can wait until we validate the core value proposition.

---

**Ready to build in 3 weeks. Ready to learn from real users. Ready to iterate based on feedback.**