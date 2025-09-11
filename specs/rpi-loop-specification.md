# RPI Loop CLI Tool - Complete Specification
*Research → Plan → Implement: A systematic methodology for AI-assisted development*

## Project Overview

**Project Name**: `rpi-loop`  
**Type**: Node.js CLI Tool  
**Purpose**: Transform AI-assisted development from "vibe coding" to systematic, specification-driven workflows  
**Primary Integration**: Claude Code (with support for Copilot, Gemini CLI)

## Problem Statement

### Current State (Vibe Coding)
- Developers spend hours in unstructured AI conversations
- Context pollution leads to decreased AI effectiveness
- Implementation surprises derail projects
- Code reviews of 2000+ line PRs are impossible
- No systematic approach to complex problems
- Team alignment lost in implementation details

### Desired State (RPI Loop)
- Structured three-phase methodology: Research → Plan → Implement
- Context utilization maintained under 40% throughout development
- Front-loaded thinking prevents implementation surprises
- Specification review replaces impossible code review
- Proven results on 300,000+ line codebases
- Team alignment through readable research and plans

## Success Criteria

### Functional Requirements
- [ ] Complete RPI cycle possible using CLI tool
- [ ] Claude Code integration with slash commands and prompts
- [ ] Context monitoring with automatic warnings at 40% threshold
- [ ] Template management system for all three phases
- [ ] Session tracking with progress visualization
- [ ] File structure management for project integration

### Performance Requirements
- [ ] <2 minutes setup time for new RPI workflow
- [ ] CLI commands respond in <500ms
- [ ] Template rendering completes in <100ms
- [ ] File operations handle projects up to 10,000 files

### Quality Requirements
- [ ] 95%+ test coverage for all core functionality
- [ ] Works on macOS, Linux, and Windows (WSL)
- [ ] Comprehensive documentation with examples
- [ ] Zero breaking changes between minor versions

### Business Requirements
- [ ] Generates useful, actionable prompts for Claude Code
- [ ] Clear progress tracking throughout RPI cycle
- [ ] Enables team collaboration through shared specifications
- [ ] Scales from individual developers to enterprise teams

## Technical Architecture

### Core Technology Stack
- **Node.js**: Runtime environment (16+ required)
- **Commander.js**: CLI argument parsing and command structure
- **Inquirer.js**: Interactive prompts and user input
- **Handlebars**: Template rendering with dynamic content
- **Chalk**: Colored terminal output for better UX
- **fs-extra**: Enhanced file system operations
- **JSON5**: Human-readable configuration files

### Project Structure
```
rpi-loop/
├── package.json                  # Project configuration and dependencies
├── bin/
│   └── rpi.js                   # CLI entry point and global command
├── lib/
│   ├── commands/                # Command implementations
│   │   ├── init.js             # rpi init [topic]
│   │   ├── research.js         # rpi research start/validate
│   │   ├── plan.js             # rpi plan start/validate
│   │   ├── implement.js        # rpi implement start/checkpoint
│   │   ├── status.js           # rpi status
│   │   └── context.js          # rpi context
│   ├── core/                   # Core functionality
│   │   ├── session.js          # Session management
│   │   ├── config.js           # Configuration handling
│   │   ├── fileManager.js      # File operations
│   │   └── contextMonitor.js   # Context tracking
│   ├── templates/              # Phase templates
│   │   ├── research.hbs        # Research phase template
│   │   ├── planning.hbs        # Planning phase template
│   │   └── implementation.hbs  # Implementation tracking template
│   ├── prompts/                # Claude Code prompts
│   │   ├── research-prompt.md  # Battle-tested research prompt
│   │   ├── planning-prompt.md  # Battle-tested planning prompt
│   │   └── implement-prompt.md # Battle-tested implementation prompt
│   └── utils/                  # Utility functions
│       ├── logger.js           # Structured logging
│       ├── validator.js        # Input validation
│       └── claudeCode.js       # Claude Code integration
├── test/                       # Test suite
│   ├── unit/                   # Unit tests
│   ├── integration/            # Integration tests
│   └── fixtures/               # Test data and examples
├── examples/                   # Real-world examples
│   ├── api-rate-limiting/      # Complete example workflow
│   ├── user-authentication/    # Authentication implementation
│   └── database-migration/     # Database schema evolution
└── docs/                       # Documentation
    ├── getting-started.md      # Quick start guide
    ├── commands.md             # Command reference
    ├── templates.md            # Template customization
    └── integration.md          # Claude Code integration guide
```

### Session Management
Each RPI workflow creates a session with the following structure in the user's project:

```
project/
├── .rpi/
│   ├── config.json             # RPI configuration
│   ├── current-session.json    # Active session state
│   └── context-budget.json     # Context monitoring data
├── rpi-sessions/
│   └── session-YYYYMMDD-NNN/   # Timestamped session directory
│       ├── 01-research.md      # Research phase output
│       ├── 02-plan.md          # Planning phase output
│       ├── 03-progress.md      # Implementation tracking
│       ├── session-config.json # Session-specific configuration
│       └── prompts/            # Generated Claude Code prompts
│           ├── research.txt    # Ready-to-use research prompt
│           ├── planning.txt    # Ready-to-use planning prompt
│           └── implement.txt   # Ready-to-use implementation prompt
└── [existing project files]
```

## Core Components Specification

### 1. Session Management (`lib/core/session.js`)
```javascript
class RPISession {
  constructor(topic, options = {}) {
    this.topic = topic;
    this.sessionId = this.generateSessionId();
    this.currentPhase = 'init';
    this.contextBudget = 0;
    this.startTime = new Date();
    this.config = options;
  }

  // Core methods to implement:
  async initialize()              // Create session directory structure
  async transitionPhase(phase)    // Move between R→P→I phases
  async saveState()              // Persist session state
  async loadState()              // Restore session state
  async getSessionPath()         // Get current session directory
  async generatePrompts()        // Create Claude Code prompts
}
```

### 2. Context Monitor (`lib/core/contextMonitor.js`)
```javascript
class ContextMonitor {
  constructor(targetUtilization = 0.4) {
    this.target = targetUtilization;
    this.current = 0;
    this.history = [];
    this.maxTokens = 170000; // Claude's context limit
  }

  // Core methods to implement:
  updateUtilization(tokens)      // Update current context usage
  checkThreshold()              // Warn when approaching 40%
  suggestCompaction()           // Recommend context cleanup
  getUtilizationReport()        // Generate status report
  recordCheckpoint(phase)       // Track phase transitions
}
```

### 3. Template System (`lib/core/fileManager.js`)
```javascript
class FileManager {
  constructor(sessionPath) {
    this.sessionPath = sessionPath;
    this.templateEngine = handlebars;
  }

  // Core methods to implement:
  async renderTemplate(template, data)  // Render Handlebars template
  async createPhaseFile(phase, content) // Create phase output file
  async loadPhaseFile(phase)           // Load existing phase file
  async generatePromptFile(phase)      // Create Claude Code prompt
  async validateFileStructure()        // Ensure proper session structure
}
```

## Command Specifications

### `rpi init [topic]`
**Purpose**: Initialize new RPI workflow for a topic
**Arguments**: 
- `topic` (optional): The topic/feature being developed
**Options**:
- `--here`: Initialize in current directory (default: create subdirectory)
- `--template`: Use specific template (future enhancement)

**Behavior**:
1. Prompt for topic if not provided
2. Create `.rpi/` configuration directory
3. Create `rpi-sessions/session-YYYYMMDD-001/` directory
4. Generate session configuration
5. Create initial file structure
6. Display next steps for research phase

### `rpi research start [topic]`
**Purpose**: Begin research phase with template and prompts
**Arguments**:
- `topic` (optional): Override session topic
**Options**:
- `--template`: Use custom research template

**Behavior**:
1. Load or create research template (`01-research.md`)
2. Generate Claude Code research prompt (`prompts/research.txt`)
3. Display template location and prompt instructions
4. Initialize context monitoring
5. Provide validation criteria checklist

### `rpi research validate`
**Purpose**: Validate research completeness before planning
**Behavior**:
1. Load current research file
2. Check against validation criteria
3. Analyze completeness and quality
4. Suggest improvements or approve for planning
5. Update session state if validated

### `rpi plan start`
**Purpose**: Generate implementation plan from validated research
**Options**:
- `--from-research`: Specify research file (default: latest)

**Behavior**:
1. Load validated research document
2. Create planning template (`02-plan.md`)
3. Generate Claude Code planning prompt with research context
4. Initialize context budget tracking
5. Provide planning validation criteria

### `rpi plan validate`
**Purpose**: Validate plan atomicity and completeness
**Behavior**:
1. Load current plan file
2. Check task atomicity (single command completable)
3. Verify all research requirements addressed
4. Validate context budget projections
5. Approve for implementation or suggest improvements

### `rpi implement start`
**Purpose**: Begin systematic implementation execution
**Options**:
- `--from-plan`: Specify plan file (default: latest)

**Behavior**:
1. Load validated implementation plan
2. Create progress tracking file (`03-progress.md`)
3. Generate Claude Code implementation prompts
4. Initialize real-time progress tracking
5. Begin context monitoring with 40% threshold

### `rpi implement checkpoint`
**Purpose**: Create context checkpoint during implementation
**Behavior**:
1. Save current implementation state
2. Analyze context utilization
3. Suggest compaction if approaching 40%
4. Prepare for fresh context if needed
5. Update progress tracking

### `rpi status`
**Purpose**: Display current RPI session status
**Behavior**:
1. Load current session state
2. Display phase progress and completion
3. Show context utilization metrics
4. List next recommended actions
5. Highlight any warnings or issues

### `rpi context`
**Purpose**: Detailed context utilization analysis
**Options**:
- `--history`: Show context history over time
- `--report`: Generate detailed report

**Behavior**:
1. Analyze current context breakdown
2. Show utilization trend and projections
3. Recommend compaction or continuation
4. Display context efficiency metrics
5. Suggest optimization strategies

## Integration Specifications

### Claude Code Integration
The tool generates ready-to-use prompts for Claude Code sessions:

**Research Prompt Template**:
```
RESEARCH PHASE: {{topic}}

I need you to research "{{topic}}" following the RPI methodology.

Focus only on the What and Why at a high level. Don't get into implementation details.

Your research should make you an expert on this topic and capture:

1. Problem Statement
   - What are we solving?
   - Why does this matter?
   - What's the current pain?

2. System Understanding
   - How does the current system work?
   - Key files: `path/file.ext:line-range`
   - Data flow and architecture
   - Critical dependencies

[... full research template ...]

Use this exact template structure: [embedded template]

IMPORTANT: Stay at high level - no implementation details in research phase.
```

**Planning Prompt Template**:
```
PLANNING PHASE: {{topic}}

Based on this validated research: [research content]

Create a detailed implementation plan with atomic tasks.

Each task must be:
- Completable by a single Claude Code command
- Clearly defined with validation criteria
- Properly sequenced with dependencies identified

Target: Keep context utilization under 40% throughout implementation.

Use this exact template structure: [embedded template]

Break the implementation into phases with context budget management.
```

## Testing Strategy

### Unit Tests (`test/unit/`)
- Session management operations
- Template rendering accuracy
- Context monitoring calculations
- File management operations
- Command argument parsing

### Integration Tests (`test/integration/`)
- Complete RPI workflow execution
- File system integration
- Template to output validation
- Context monitoring integration
- Error handling scenarios

### End-to-End Tests
- Full project initialization to completion
- Claude Code prompt generation and usage
- Multi-session project handling
- Cross-platform compatibility

## Documentation Requirements

### User Documentation
1. **Getting Started Guide**: Installation, first RPI workflow
2. **Command Reference**: Detailed command documentation
3. **Template Guide**: Customization and best practices
4. **Integration Guide**: Claude Code setup and usage
5. **Troubleshooting**: Common issues and solutions

### Developer Documentation
1. **Architecture Overview**: System design and components
2. **API Reference**: Internal APIs and extension points
3. **Contributing Guide**: Development setup and guidelines
4. **Testing Guide**: Running and writing tests

## Validation and Success Metrics

### Development Phase Validation
- [ ] Each command works independently
- [ ] Complete RPI cycle possible without errors
- [ ] Templates render correctly with dynamic content
- [ ] Context monitoring accurately tracks utilization
- [ ] File operations handle edge cases gracefully

### User Experience Validation
- [ ] Setup time under 2 minutes for new users
- [ ] Clear, actionable output from all commands
- [ ] Intuitive command structure and options
- [ ] Helpful error messages with suggested fixes
- [ ] Seamless integration with Claude Code workflow

### Quality Assurance
- [ ] 95%+ test coverage maintained
- [ ] No memory leaks in long-running sessions
- [ ] Graceful handling of interrupted operations
- [ ] Backward compatibility with session formats
- [ ] Security review of file operations

This specification provides the complete blueprint for building the RPI Loop CLI tool that transforms AI-assisted development from chaotic "vibe coding" into systematic, specification-driven workflows with proven enterprise results.