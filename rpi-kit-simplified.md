# RPI-Kit: Simplified Implementation Plan
*From 32 tasks → 5 files. From 3 weeks → 1 day.*

## What We're Building

A simple toolkit that installs RPI (Research → Plan → Implement) templates into any project, supporting:
- ✅ Claude Code (Desktop)
- ✅ GitHub Copilot (VS Code)
- ✅ Google Gemini (Cloud Console)

## Installation (Dead Simple)

```bash
# One-line install (will be in README for easy copy/paste)
curl -sSL https://raw.githubusercontent.com/yourusername/rpi-kit/main/install.sh | bash
```

Or with specific AI tool:
```bash
# For Claude Code users
curl -sSL https://raw.githubusercontent.com/yourusername/rpi-kit/main/install.sh | bash -s -- --ai claude

# For GitHub Copilot users
curl -sSL https://raw.githubusercontent.com/yourusername/rpi-kit/main/install.sh | bash -s -- --ai copilot

# For Gemini users
curl -sSL https://raw.githubusercontent.com/yourusername/rpi-kit/main/install.sh | bash -s -- --ai gemini
```

## What Gets Installed

```
your-project/
├── .rpi/                              # All RPI files in hidden directory
│   ├── VERSION                        # Track installed version
│   ├── README.md                      # Quick reference guide
│   ├── templates/                     # Core templates
│   │   ├── research.md               # Research phase template
│   │   ├── plan.md                   # Planning phase template
│   │   └── implement.md              # Implementation tracking template
│   ├── prompts/                       # AI-specific prompts
│   │   ├── claude/                   # Claude Code prompts
│   │   │   ├── research.md          
│   │   │   ├── plan.md              
│   │   │   └── implement.md         
│   │   ├── copilot/                  # GitHub Copilot prompts
│   │   │   ├── research.md          
│   │   │   ├── plan.md              
│   │   │   └── implement.md         
│   │   └── gemini/                   # Gemini prompts
│   │       ├── research.md          
│   │       ├── plan.md              
│   │       └── implement.md         
│   ├── current/                       # Your current work
│   │   ├── topic.txt                 # Current topic/feature
│   │   ├── research.md               # Your research output
│   │   ├── plan.md                   # Your plan output
│   │   └── progress.md               # Your implementation progress
│   └── examples/                      # Example workflows
│       └── api-rate-limiting/         # Complete example
│           ├── research.md
│           ├── plan.md
│           └── progress.md
```

## Files We Need to Create

### 1. `install.sh` - The Installer
```bash
#!/bin/bash
# Smart installer that:
# - Detects which directory to install in
# - Downloads all templates from GitHub
# - Sets up .rpi/ structure
# - Detects AI tool if possible (looks for .claude, copilot settings, etc.)
# - Shows quick start instructions
```

### 2. `templates/research.md` - Universal Research Template
```markdown
# Research: [TOPIC]

## Problem Statement
- What problem are we solving?
- Why does this matter?
- What's the current state?

## System Understanding
<!-- For existing codebases -->
- Key files and components: `file:line`
- Current implementation details
- Integration points

## Requirements
- Functional requirements
- Technical constraints  
- Success criteria

## Open Questions
- [ ] Questions that need answers
- [ ] Technical unknowns
- [ ] Decisions to be made

## Context & Notes
<!-- Any additional context, links, or notes -->
```

### 3. `templates/plan.md` - Universal Planning Template
```markdown
# Implementation Plan: [TOPIC]

## Strategy
<!-- High-level approach based on research -->

## Phase 1: [Name]
<!-- Group related tasks -->
- [ ] Task 1 (atomic, single AI prompt/command)
- [ ] Task 2 (atomic, single AI prompt/command)
- [ ] Task 3 (atomic, single AI prompt/command)

## Phase 2: [Name]
- [ ] Task 4 (atomic, single AI prompt/command)
- [ ] Task 5 (atomic, single AI prompt/command)

## Testing Strategy
- How will we validate each phase?
- What tests need to be written?

## Risk Mitigation
- Potential issues
- Backup approaches
- Rollback plan
```

### 4. `templates/implement.md` - Progress Tracking
```markdown
# Implementation Progress: [TOPIC]

## Status
- **Current Phase**: X of Y
- **Completed Tasks**: X of Y
- **Current Task**: [Description]

## Completed
- [x] Task 1 - [Outcome/Notes]
- [x] Task 2 - [Outcome/Notes]

## In Progress
- [ ] Current task details
- Notes on approach
- Any blockers

## Deviations from Plan
<!-- Document any changes from original plan and why -->

## Test Results
<!-- Results from testing each phase -->
```

### 5. AI-Specific Prompts

#### Claude Code (`prompts/claude/research.md`)
```markdown
I need to research "[TOPIC]" for implementation. Please help me fill out this research template following the RPI (Research → Plan → Implement) methodology.

Focus on understanding the problem deeply without jumping to implementation details. Include specific file:line references where relevant.

[TEMPLATE CONTENT]

Please be thorough but stay at the conceptual level - we'll plan implementation details in the next phase.
```

#### GitHub Copilot (`prompts/copilot/research.md`)
```markdown
# Research Request: [TOPIC]

Help me research this topic using the RPI methodology. Fill out the template below with detailed information about the problem space.

Important: 
- Focus on WHAT and WHY, not HOW
- Include file:line references for existing code
- Don't suggest implementation yet

[TEMPLATE CONTENT]
```

#### Gemini (`prompts/gemini/research.md`)
```markdown
I'm using the RPI (Research → Plan → Implement) methodology. This is the RESEARCH phase for: [TOPIC]

Please help complete this research template. Focus on understanding requirements and constraints without proposing solutions yet.

[TEMPLATE CONTENT]

Keep responses factual and comprehensive. We'll create the implementation plan in the next phase.
```

## Usage Flow

### 1. Installation
```bash
# User copies this from README
curl -sSL https://raw.githubusercontent.com/yourusername/rpi-kit/main/install.sh | bash
```

### 2. Start Research
```bash
# User manually:
1. Edit .rpi/current/topic.txt with their feature
2. Copy .rpi/prompts/[tool]/research.md to their AI tool
3. Save AI response to .rpi/current/research.md
```

### 3. Create Plan
```bash
# User manually:
1. Copy .rpi/current/research.md + .rpi/prompts/[tool]/plan.md to AI
2. Save AI response to .rpi/current/plan.md
```

### 4. Implement
```bash
# User manually:
1. Copy .rpi/current/plan.md + .rpi/prompts/[tool]/implement.md to AI
2. Update .rpi/current/progress.md as they work
```

## Repository Structure

```
rpi-kit/
├── README.md                    # Simple, compelling README
├── install.sh                   # Main installer script
├── templates/                   # Universal templates
│   ├── research.md
│   ├── plan.md
│   └── implement.md
├── prompts/                     # AI-specific prompts
│   ├── claude/
│   │   ├── research.md
│   │   ├── plan.md
│   │   └── implement.md
│   ├── copilot/
│   │   ├── research.md
│   │   ├── plan.md
│   │   └── implement.md
│   └── gemini/
│       ├── research.md
│       ├── plan.md
│       └── implement.md
├── examples/                    # Complete example
│   └── api-rate-limiting/
│       ├── research.md
│       ├── plan.md
│       └── progress.md
└── docs/                       # Optional docs
    ├── methodology.md          # Explain RPI
    └── ai-tools.md            # Tool-specific tips
```

## Implementation Tasks (Just 5!)

1. [ ] Create `install.sh` script that downloads and sets up files
2. [ ] Create universal templates (research, plan, implement)
3. [ ] Create AI-specific prompts for all three tools
4. [ ] Create one solid example (API rate limiting)
5. [ ] Write simple, compelling README with copy-paste install

## Why This Is Better

### Compared to CLI Approach
- **5 tasks vs 32 tasks** (84% reduction)
- **1 day vs 3 weeks** (95% time saved)
- **0 dependencies vs 4+** (100% simpler)
- **Works with ANY AI tool** vs Claude-only
- **No maintenance burden** vs ongoing CLI support

### Compared to Spec-Kit
- **Simpler install** (one curl command)
- **Better methodology** (RPI is proven)
- **Multi-tool support** from day one
- **Cleaner structure** (.rpi directory)
- **More focused** (just RPI, not trying to be everything)

## Success Metrics (Simplified)

Week 1:
- [ ] 50+ GitHub stars
- [ ] Works perfectly with all 3 AI tools
- [ ] 5+ developers try it successfully

Month 1:
- [ ] 200+ GitHub stars
- [ ] Community starts contributing templates
- [ ] Clear feedback on what features to add

## Next Steps

1. **Today**: Create the 5 core files
2. **Tomorrow**: Test with all three AI tools
3. **Day 3**: Polish and launch on HN/Reddit/Twitter

This is SO much simpler and will actually ship!