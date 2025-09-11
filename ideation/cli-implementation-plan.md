# RPI Loop CLI: Implementation Plan

## Project Overview

Building `rpi-loop` - a Node.js CLI tool that enables the Research→Plan→Implement methodology for AI-assisted development, with primary integration for Claude Code.

## MVP Feature Set

### Core Commands
1. `rpi init [topic]` - Initialize RPI workflow
2. `rpi research start [topic]` - Begin research phase  
3. `rpi plan start` - Generate implementation plan
4. `rpi implement start` - Execute implementation
5. `rpi status` - Show current progress
6. `rpi context` - Monitor context utilization

### File Structure
```
rpi-loop/
├── package.json
├── bin/
│   └── rpi.js                    # CLI entry point
├── lib/
│   ├── commands/
│   │   ├── init.js
│   │   ├── research.js
│   │   ├── plan.js
│   │   ├── implement.js
│   │   └── status.js
│   ├── templates/
│   │   ├── research.md
│   │   ├── planning.md
│   │   └── implementation.md
│   ├── utils/
│   │   ├── fileManager.js
│   │   ├── contextMonitor.js
│   │   └── claudeCodeIntegration.js
│   └── core/
│       ├── session.js
│       └── config.js
├── prompts/                      # Battle-tested prompts
│   ├── research-prompt.md
│   ├── planning-prompt.md
│   └── implementation-prompt.md
└── examples/
    └── api-rate-limiting/        # Complete example
```

## Technical Architecture

### CLI Framework
- **Commander.js** for CLI argument parsing
- **Inquirer.js** for interactive prompts
- **Chalk** for colored output
- **fs-extra** for file operations
- **handlebars** for template rendering

### Session Management
```javascript
class RPISession {
  constructor(topic, sessionId) {
    this.topic = topic;
    this.sessionId = sessionId;
    this.currentPhase = 'init';
    this.contextBudget = 0;
    this.startTime = new Date();
  }

  async initializeSession() {
    // Create .rpi directory structure
    // Generate session ID
    // Create initial config
  }

  async transitionPhase(newPhase) {
    // Validate phase transition
    // Update session state
    // Prepare templates for new phase
  }
}
```

### Context Monitoring
```javascript
class ContextMonitor {
  constructor(targetUtilization = 0.4) {
    this.target = targetUtilization;
    this.current = 0;
    this.history = [];
  }

  updateUtilization(tokens, maxTokens = 170000) {
    this.current = tokens / maxTokens;
    this.history.push({
      timestamp: new Date(),
      utilization: this.current
    });
    
    if (this.current > this.target) {
      this.triggerCompactionWarning();
    }
  }

  suggestCompaction() {
    return this.current > (this.target * 0.9);
  }
}
```

## Implementation Phases

### Phase 1: Core CLI Infrastructure (Week 1)
```bash
# Initialize Node.js project
npm init -y
npm install commander inquirer chalk fs-extra handlebars

# Implement core commands
├── rpi init [topic]
├── rpi status  
└── Basic file structure creation
```

### Phase 2: Template System (Week 1)
```bash
# Template rendering and management
├── Handlebars template integration
├── Dynamic template population
├── File creation and management
└── Session state tracking
```

### Phase 3: Claude Code Integration (Week 2)
```bash
# Integration features
├── Generate Claude Code slash commands
├── Export prompts for copy-paste
├── Session import/export
└── Context monitoring utilities
```

### Phase 4: Advanced Features (Week 2)
```bash
# Enhancement features  
├── Context utilization monitoring
├── Automatic compaction suggestions
├── Team collaboration features
└── Analytics and reporting
```

## Claude Code Integration Strategy

### Approach 1: Prompt Generation
The CLI generates ready-to-use prompts for Claude Code:

```javascript
// Generate research prompt
rpi research prompt

// Output:
RESEARCH PHASE - API Rate Limiting

I need you to research "API rate limiting for user endpoints" following the RPI methodology. 

Focus only on the What and Why at a high level. Don't get into implementation details.

Use this template structure:
[research template content]

Your research should make you an expert on this topic and identify...
```

### Approach 2: File Monitoring
The CLI watches for file changes and suggests next steps:

```bash
# CLI monitors rpi-sessions/session-001/
# When 01-research.md is updated:
✅ Research phase updated
💡 Ready for planning? Run: rpi plan start
🎯 Or validate research: rpi research validate
```

### Approach 3: Session Export
Export complete sessions for sharing:

```bash
rpi export session-001
# Creates: session-001-export.zip
# Contains: All session files + prompts + instructions
```

## Installation & Usage

### Global Installation
```bash
npm install -g rpi-loop
cd your-project
rpi init "new feature implementation"
```

### Project-specific Installation  
```bash
npm install --save-dev rpi-loop
npx rpi init "new feature implementation"
```

### Basic Workflow
```bash
# 1. Initialize
rpi init "user authentication system"

# 2. Research phase
rpi research start "user authentication system"
# -> Opens research template
# -> Work with Claude Code using generated prompts
# -> Save research to 01-research.md

# 3. Validate research
rpi research validate
# -> Checks completeness
# -> Suggests improvements

# 4. Planning phase  
rpi plan start
# -> Takes research as input
# -> Generates planning template
# -> Work with Claude Code to create detailed plan

# 5. Implementation phase
rpi implement start
# -> Loads plan
# -> Tracks progress
# -> Monitors context utilization
```

## File Structure Created by CLI

### Project Integration
```
your-project/
├── .rpi/
│   ├── config.json              # RPI configuration
│   ├── current-session.json     # Active session tracking
│   └── context-budget.json      # Context monitoring
├── rpi-sessions/
│   └── session-20240115-001/    # Timestamped sessions
│       ├── 01-research.md       # Research output
│       ├── 02-plan.md           # Planning output  
│       ├── 03-progress.md       # Implementation tracking
│       └── prompts/             # Generated prompts
│           ├── research.txt
│           ├── planning.txt
│           └── implementation.txt
└── [existing project files]
```

## CLI Output Examples

### Status Command
```bash
$ rpi status

🚀 RPI Session: user-authentication-system
📅 Started: 2024-01-15 14:30:22 (2h 15m ago)
📊 Current Phase: Implementation (2/3)

Progress:
✅ Research    [100%] - Complete (28% context)
✅ Planning    [100%] - Complete (15% context) 
🔄 Implement   [ 65%] - Phase 1 complete, Phase 2 in progress

Context Budget: 31% / 40% target ✅

Next Actions:
💡 Continue Phase 2: API Integration
⚠️  Context approaching 35% - consider checkpoint
📋 3 tasks remaining in current phase
```

### Context Monitoring
```bash
$ rpi context

📊 Context Utilization Analysis

Current Session: 31% / 40% target ✅

Breakdown:
├── Research (compacted):     8%
├── Planning (compacted):     6% 
├── Implementation:          17%
└── Working Memory:           0%

Trend: ↑ Increasing (implementation complexity)
Recommendation: ✅ Continue - healthy utilization

History:
├── 14:30 Research Start:     0%
├── 15:45 Planning Start:    15%
├── 16:20 Implement Start:   18%
└── 17:32 Current:           31%

Next Checkpoint: Phase 2 completion (est. 35%)
```

## MVP Validation Criteria

### Week 1 Goals
- [ ] CLI installs and runs on macOS/Linux
- [ ] Basic session creation and file structure
- [ ] Template rendering with dynamic content
- [ ] Research and planning phases functional

### Week 2 Goals  
- [ ] Full implementation phase support
- [ ] Context monitoring and warnings
- [ ] Claude Code prompt generation
- [ ] Session export/import functionality
- [ ] Documentation and examples complete

### Success Metrics
- [ ] Complete RPI cycle possible using CLI
- [ ] <2 minutes setup time for new project
- [ ] Generates useful prompts for Claude Code
- [ ] Maintains context budget visibility
- [ ] Clear progress tracking throughout cycle

## Next Steps

1. **Set up Node.js project structure**
2. **Implement core CLI commands with Commander.js**
3. **Create template rendering system**
4. **Test with real Claude Code workflow**
5. **Add context monitoring features**
6. **Package for npm distribution**

This MVP focuses on the essential workflow while being extensible for advanced features. The goal is to make the RPI Loop methodology accessible and practical for any developer using Claude Code.