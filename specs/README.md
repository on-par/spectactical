# RPI Loop Tool - Complete Specification Package
*Everything needed to build the Research → Plan → Implement methodology tool*

## What This Contains

This `specs/` directory contains the **complete specification package** for building the RPI Loop CLI tool - a revolutionary system that transforms AI-assisted development from chaotic "vibe coding" into systematic, specification-driven workflows with proven enterprise results.

## 🎯 Project Overview

**RPI Loop** is a Node.js CLI tool that implements the proven Research → Plan → Implement methodology:
- **Research Phase**: Understand the problem without implementation details
- **Planning Phase**: Break research into atomic, executable tasks  
- **Implementation Phase**: Systematically execute with context management

**Proven Results**: Used successfully on 300,000+ line codebases, teams shipping without reading code, context efficiency <40%, enterprise-grade quality.

## 📁 Directory Structure

```
specs/
├── README.md                           # This file - overview and usage guide
├── rpi-loop-specification.md           # Complete project specification
├── implementation-todos.md             # Atomic implementation tasks (8 phases)
├── templates/                          # Handlebars templates for all phases
│   ├── research-template.hbs           # Research phase template
│   ├── planning-template.hbs           # Planning phase template
│   └── implementation-template.hbs     # Implementation tracking template
├── claude-code-prompts/                # Ready-to-use prompts for Claude Code
│   ├── research-prompt.md              # Battle-tested research prompt
│   ├── planning-prompt.md              # Battle-tested planning prompt
│   └── implementation-prompt.md        # Battle-tested implementation prompt
└── examples/                           # Real-world workflow examples
    └── api-rate-limiting-complete-workflow.md  # Complete example workflow
```

## 🚀 How to Use This Specification

### Step 1: Read the Main Specification
Start with `rpi-loop-specification.md`:
- Complete project overview and requirements
- Technical architecture and component design
- Success criteria and validation requirements
- Integration specifications for Claude Code

### Step 2: Follow the Implementation Plan
Use `implementation-todos.md` for building:
- **8 implementation phases** with atomic tasks
- Each task completable by a single command
- Context budget management throughout
- Clear completion criteria for each phase

### Step 3: Implement Templates and Prompts
Use the `templates/` and `claude-code-prompts/` directories:
- Handlebars templates for dynamic content generation
- Battle-tested prompts proven in enterprise environments
- Claude Code integration with copy-paste ready prompts

### Step 4: Validate with Examples
Use `examples/` for testing and validation:
- Complete real-world workflow demonstration
- Shows input/output for all three phases
- Demonstrates context management and quality outcomes

## 🛠️ Quick Start for Developers

### 1. Initial Setup
```bash
# Create project directory
mkdir rpi-loop && cd rpi-loop

# Initialize Node.js project
npm init -y

# Install dependencies (from implementation-todos.md)
npm install commander inquirer handlebars chalk fs-extra json5
npm install --save-dev jest eslint prettier
```

### 2. Core Implementation Phases
Follow the atomic tasks in `implementation-todos.md`:

**Phase 1: Project Foundation** (Week 1)
- Project initialization and dependency setup
- Directory structure creation
- Basic package.json configuration

**Phase 2: Core Infrastructure** (Week 1)  
- CLI entry point with Commander.js
- Session management system
- Configuration and file management

**Phase 3: Command Implementation** (Week 2)
- All core commands (init, research, plan, implement, status, context)
- Argument parsing and validation
- Basic workflow functionality

**Phase 4: Templates & Prompts** (Week 2)
- Handlebars template system
- Claude Code prompt generation
- Template customization support

**Phase 5: Context Monitoring** (Week 3)
- Context utilization tracking (<40% target)
- Automatic compaction suggestions
- Context analysis and reporting

**Phase 6: Testing & Quality** (Week 3)
- Comprehensive test suite (95%+ coverage)
- Error handling and edge cases
- Code quality standards

**Phase 7: Examples & Documentation** (Week 4)
- Real-world examples
- User and developer documentation
- Package preparation

**Phase 8: Deployment & Distribution** (Week 4)
- NPM package publishing
- Cross-platform testing
- Final validation

### 3. Key Success Metrics
- ✅ Complete RPI cycle (init → research → plan → implement) works end-to-end
- ✅ Context monitoring maintains <40% utilization
- ✅ Claude Code integration generates useful prompts
- ✅ Setup time <2 minutes for new users
- ✅ All commands respond <500ms

## 💡 Key Implementation Insights

### Context Management (Critical)
- **40% Rule**: Keep context utilization under 40% throughout
- **Intentional Compaction**: Systematic context cleanup between phases
- **Fresh Contexts**: Each phase starts with optimal context state

### Task Atomicity (Essential)
- **Single Command**: Each task completable by one Claude Code session
- **Clear Validation**: Every task has specific success criteria
- **No Dependencies**: Tasks independent within phases

### Template System (Core)
- **Dynamic Content**: Handlebars templates with real-time data
- **Customizable**: User can override templates
- **Consistent**: Standard structure across all phases

### Claude Code Integration (Primary)
- **Ready-to-Use**: Generated prompts work immediately
- **Context Aware**: Prompts include relevant context from previous phases
- **Battle-Tested**: Prompts proven on enterprise codebases

## 📊 Expected Outcomes

### For Individual Developers
- **Systematic Approach**: Replaces ad-hoc "vibe coding"
- **Context Efficiency**: Better AI effectiveness through management
- **Quality Assurance**: Front-loaded thinking prevents surprises
- **Clear Progress**: Measurable milestones throughout

### For Teams
- **Specification Review**: 200-line specs vs 2000-line PRs
- **Shared Understanding**: Readable research and plans
- **Knowledge Transfer**: Living documentation
- **Risk Reduction**: Early problem identification

### For Organizations
- **Faster Development**: Fewer surprises and rework
- **Better Quality**: Systematic validation throughout
- **Team Alignment**: Clear communication on complex problems
- **Reproducible Process**: Scalable across projects and teams

## 🎯 Success Validation

### When RPI Loop Tool is Complete:
1. **New user can complete first RPI cycle in <30 minutes**
2. **Context monitoring prevents >40% utilization**
3. **Claude Code prompts generate immediately useful output**
4. **Templates render correctly with dynamic content**
5. **Complete workflow from init to implementation works smoothly**

### Quality Gates:
- ✅ 95%+ test coverage maintained
- ✅ All atomic tasks completable as specified
- ✅ Cross-platform compatibility (macOS, Linux, Windows WSL)
- ✅ Performance targets met (<500ms commands, <2min setup)

## 🚨 Critical Implementation Notes

### Must-Have Features:
1. **Context Monitoring**: 40% threshold with automatic warnings
2. **Template System**: Dynamic content generation with Handlebars
3. **Claude Code Integration**: Ready-to-use prompt generation
4. **Session Management**: Persistent state across phase transitions
5. **Atomic Task Validation**: Each task independently executable

### Integration Requirements:
- **Primary**: Claude Code (slash commands, prompts)
- **Secondary**: Copilot, Gemini CLI (future enhancement)
- **File System**: Standard git projects, any programming language
- **Deployment**: NPM global install, cross-platform support

### Quality Standards:
- **Code Quality**: ESLint + Prettier, comprehensive error handling
- **Testing**: Jest with 95%+ coverage, integration tests
- **Documentation**: User guides, developer docs, API reference
- **Performance**: <500ms commands, <100ms template rendering

## 🔥 Why This Matters

This tool represents a **fundamental shift** in AI-assisted development:

### From Reactive to Proactive
- Traditional: Fix problems during implementation
- RPI Loop: Prevent problems through systematic planning

### From Code-First to Specification-First  
- Traditional: Write code, then document
- RPI Loop: Specify intent, then implement systematically

### From Individual to Systematic
- Traditional: Each developer has their own approach
- RPI Loop: Shared methodology with proven results

### From Ad-hoc to Measurable
- Traditional: Success depends on individual skill
- RPI Loop: Reproducible process with clear metrics

## 🎉 Ready to Build

This specification package contains **everything needed** to build a production-ready tool that:
- ✅ Transforms AI-assisted development methodology
- ✅ Has proven results on enterprise codebases
- ✅ Works seamlessly with Claude Code
- ✅ Scales from individual developers to large teams
- ✅ Produces measurably better software development outcomes

**The future of systematic, AI-assisted development starts with implementing this specification.**

---

## Quick Implementation Start

1. **Read**: `rpi-loop-specification.md` (complete overview)
2. **Plan**: `implementation-todos.md` (8-phase execution plan)
3. **Build**: Follow atomic tasks with <40% context utilization
4. **Test**: Use `examples/` for validation
5. **Deploy**: NPM package for global adoption

**Time to transform software development. Time to build the future.**