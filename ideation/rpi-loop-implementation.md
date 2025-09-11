# RPI Loop: Practical Implementation Strategy

## Lightweight Implementation Approach

The goal is to create a system that adds minimal overhead while maximizing value. The implementation should feel natural and integrate seamlessly with existing development workflows.

## Core Implementation Components

### 1. File Structure Convention
```
project/
├── rpi/
│   ├── research/
│   │   ├── 01-initial-research.md
│   │   ├── 02-validation-feedback.md
│   │   └── 03-final-research.md
│   ├── planning/
│   │   ├── 01-initial-plan.md
│   │   ├── 02-validation-feedback.md
│   │   └── 03-final-plan.md
│   └── implementation/
│       ├── progress.md
│       └── completion-report.md
└── [normal project files]
```

### 2. Slash Commands for Claude Code

Create simple slash commands that can be used in Claude Code sessions:

```
/rpi-research [topic]     # Start research phase
/rpi-validate-research    # Validate current research
/rpi-plan                 # Start planning phase  
/rpi-validate-plan        # Validate current plan
/rpi-implement            # Start implementation phase
/rpi-status               # Show current RPI status
```

### 3. Template System

#### Research Template
```markdown
# Research: [Topic Name]

## Problem Statement
What are we trying to solve?

## Business Context
Why is this important?

## User Needs
Who benefits and how?

## Constraints & Requirements
What are the limitations?

## Success Criteria
How do we know when we're done?

## Open Questions
What needs clarification?

---
**Status**: Draft | Validated | Complete
**Validation Notes**: [AI/Human feedback here]
```

#### Planning Template
```markdown
# Plan: [Topic Name]

## Overview
Brief summary of what we're building

## Architecture Decisions
High-level technical approach

## Task Breakdown

### Phase 1: Foundation
- [ ] Set up project structure
- [ ] Configure build system
- [ ] Create base components

### Phase 2: Core Features
- [ ] Implement feature A
- [ ] Implement feature B
- [ ] Add error handling

### Phase 3: Integration & Testing
- [ ] Integration tests
- [ ] End-to-end testing
- [ ] Documentation

## Dependencies
What needs to happen in order?

## Risk Assessment
What could go wrong?

---
**Status**: Draft | Validated | Complete
**Validation Notes**: [AI/Human feedback here]
```

## Integration with Claude Code

### Approach 1: Prompt Engineering
Create standardized prompts that can be copy-pasted into Claude Code:

```
RESEARCH PHASE PROMPT:
"I need you to research [topic] following the RPI methodology. Focus only on the What and Why at a high level. Don't get into implementation details. Output should be a comprehensive research document that makes you an expert on this topic. Ask clarifying questions as needed."

VALIDATION PROMPT:
"Please review this research document and validate its completeness and accuracy. Identify any gaps, inconsistencies, or areas that need more depth. Provide specific feedback for improvements."

PLANNING PROMPT:
"Based on this validated research, create a detailed plan with atomic TODO items. Each task should be completable by a single command (CLI, file creation, file edit, tool use). Ensure all research items are covered."
```

### Approach 2: Custom Claude Code Extension
Develop a simple extension or configuration that adds RPI commands to Claude Code.

### Approach 3: External CLI Tool
Create a lightweight CLI tool that manages the RPI process and interfaces with Claude Code:

```bash
rpi init [project-name]           # Initialize RPI structure
rpi research start [topic]        # Begin research phase
rpi research validate            # Run validation on current research
rpi plan start                   # Begin planning phase
rpi plan validate               # Run validation on current plan
rpi implement start             # Begin implementation
rpi status                      # Show current phase and progress
```

## Validation Mechanisms

### Automated AI Validation
Create specific prompts for each phase that act as quality gates:

```markdown
RESEARCH VALIDATION CHECKLIST:
- [ ] Problem clearly defined
- [ ] Business context explained
- [ ] User needs identified
- [ ] Technical constraints listed
- [ ] Success criteria defined
- [ ] No implementation details included
- [ ] All questions answered

PLAN VALIDATION CHECKLIST:
- [ ] All research items addressed
- [ ] Tasks are atomic (single command)
- [ ] Dependencies clearly identified
- [ ] No task ambiguity
- [ ] Covers 100% of scope
- [ ] Realistic time estimates
```

### Human Validation Workflow
Simple checklist-based review process that can be done quickly:

1. Read the document
2. Check against validation criteria
3. Add comments/suggestions
4. Mark as "Approved" or "Needs Revision"

## Minimal Friction Design

### Principle 1: Convention Over Configuration
- Standard file names and locations
- Predictable workflow steps
- Minimal setup required

### Principle 2: Progressive Enhancement
- Works with basic markdown files
- Enhanced with tooling when available
- Graceful degradation without tools

### Principle 3: Integration-Friendly
- Works with existing git workflows
- Compatible with any text editor
- No proprietary file formats

## Example Implementation Session

```bash
# Initialize RPI for new feature
rpi init user-authentication

# Start research phase
rpi research start "user authentication system"
# -> Opens research template in editor
# -> Researcher fills out template
# -> Saves to rpi/research/01-initial-research.md

# Validate research
rpi research validate
# -> Runs AI validation against research
# -> Outputs feedback to rpi/research/02-validation-feedback.md
# -> Researcher updates research based on feedback

# Start planning phase
rpi plan start
# -> Takes validated research as input
# -> Creates initial plan in rpi/planning/01-initial-plan.md

# Validate plan
rpi plan validate
# -> Checks plan completeness and atomicity
# -> Ensures all research is covered

# Start implementation
rpi implement start
# -> Loads final plan
# -> Begins executing TODOs one by one
# -> Updates progress in real-time
```

## Success Metrics

### Adoption Metrics
- Time to first successful RPI loop
- Number of projects using RPI methodology
- User feedback scores

### Quality Metrics
- Reduction in implementation surprises
- Improvement in project completion rates
- Better alignment between initial goals and final deliverables

### Efficiency Metrics
- Time spent in each phase
- Number of validation iterations needed
- Overall project timeline improvements

## Next Steps

1. **Prototype the file structure** with a real project
2. **Test the prompt engineering approach** with Claude Code
3. **Create basic templates** and refine through usage
4. **Build simple CLI tool** for automation
5. **Gather feedback** from early adopters
6. **Iterate and improve** based on real-world usage

The key is to start simple and evolve the system based on actual usage patterns and feedback from developers using it in real projects.