# RPI Loop Tool - MVP Specification Package
*Simplified specification for rapid MVP delivery*

## What This Contains

This `specs/` directory contains the **MVP specification** for building the RPI Loop CLI tool - a simple prompt generator that helps developers create better Claude Code prompts using the proven Research → Plan → Implement methodology.

## 🎯 MVP Focus

**RPI Loop MVP** is a lightweight Node.js CLI tool that:
- **Generates Better Prompts**: Creates structured prompts for Claude Code
- **Follows RPI Methodology**: Research → Plan → Implement workflow  
- **Simple Installation**: Works in <2 minutes with zero configuration
- **Immediate Value**: Better AI responses from first use

**Proven Results**: Based on methodology used successfully on 300,000+ line codebases, now simplified for individual developer adoption.

## 📁 Directory Structure

```
specs/
├── README.md                           # This file - MVP overview
├── implementation-todos-mvp.md         # 32 atomic tasks for MVP (3 weeks)
├── mvp-success-criteria.md             # Clear validation metrics
├── rpi-loop-specification.md           # Core methodology specification
├── claude-code-prompts/                # Ready-to-use prompts for Claude Code
│   ├── research-prompt.md              # Battle-tested research prompt
│   ├── planning-prompt.md              # Battle-tested planning prompt
│   └── implementation-prompt.md        # Battle-tested implementation prompt
├── examples/                           # Real-world workflow examples
│   └── api-rate-limiting-complete-workflow.md  # Complete example workflow
└── archive/                            # Previous complex specifications
    └── implementation-todos-v1.md      # Original 158-task plan (archived)
```

## 🚀 How to Build the MVP

### Step 1: Review MVP Plan
Start with `implementation-todos-mvp.md`:
- **32 atomic tasks** organized in 3 phases
- **3-week timeline** for MVP delivery
- Each task completable in single session
- Clear validation for each phase

### Step 2: Validate Success Criteria
Use `mvp-success-criteria.md` throughout:
- Clear metrics for launch readiness
- Go/no-go decision criteria
- User validation requirements
- Failure indicators to watch

### Step 3: Reference Methodology
Consult `rpi-loop-specification.md` for:
- Core methodology understanding
- Claude Code integration approach
- Template structure guidance
- But skip complex features for MVP

### Step 4: Test with Example
Use `examples/api-rate-limiting-complete-workflow.md`:
- See complete RPI workflow in action
- Understand expected outputs
- Validate MVP produces similar quality

## 🛠️ Quick Start for MVP Development

### 1. Initial Setup (Simplified)
```bash
# Create project directory
mkdir rpi-loop && cd rpi-loop

# Initialize Node.js project
npm init -y

# Install MVP dependencies only
npm install commander fs-extra handlebars chalk
# Skip test frameworks and linting for MVP
```

### 2. MVP Implementation Phases
Follow the 32 tasks in `implementation-todos-mvp.md`:

**Phase 1: Core CLI Foundation** (Week 1)
- Basic project setup (5 tasks)
- Core commands implementation (8 tasks)
- Simple file management (7 tasks)

**Phase 2: Claude Code Excellence** (Week 1)
- Perfect prompt generation (6 tasks)
- User experience polish (4 tasks)

**Phase 3: Distribution** (Week 1)
- Basic testing (3 tasks)
- Documentation & npm publish (5 tasks)

### 3. MVP Success Metrics
- ✅ Installation works in <2 minutes
- ✅ First RPI cycle completes in <10 minutes
- ✅ Generated prompts improve Claude Code outputs
- ✅ Zero configuration required
- ✅ Works on Mac, Linux, Windows

## 💡 MVP Implementation Focus

### Simplicity First
- **No Complex Features**: Skip context monitoring, session management
- **Basic Templates**: Simple, effective templates without customization
- **Zero Configuration**: Works immediately after installation

### Claude Code Integration (Critical)
- **Perfect Prompts**: Focus on prompt quality over features
- **Copy-Paste Ready**: Prompts work immediately in Claude Code
- **Context Handoff**: Simple inclusion of previous phase content

### Rapid Validation
- **3-Week Timeline**: Ship fast, iterate based on feedback
- **32 Tasks Total**: 80% reduction from original plan
- **User Testing**: 10 developers must succeed in first month

## 📊 Expected MVP Outcomes

### Week 1: Working Tool
- Basic CLI with all core commands
- Simple templates rendering correctly
- Complete workflow functional

### Week 2: Quality Prompts
- Claude Code prompts generating better responses
- User experience polished and intuitive
- Error handling graceful

### Week 3: Public Release
- npm package published and installable
- Documentation enables self-service adoption
- First users completing successful RPI cycles

### Month 1: Validation
- 100+ GitHub stars showing interest
- 10+ developers using successfully
- Clear feedback on what to build next

## 🎯 MVP Success Validation

### When MVP is Ready:
1. **New user completes first RPI cycle in <15 minutes**
2. **Installation works without configuration**
3. **Claude Code prompts demonstrably improve outputs**
4. **Complete workflow executes without errors**
5. **10 beta testers successfully use the tool**

### Launch Criteria:
- ✅ Works on Mac, Linux, Windows
- ✅ Zero critical bugs
- ✅ README enables self-service
- ✅ npm package installs globally

## 🚨 MVP Critical Requirements

### Must Work Perfectly:
1. **Installation**: `npm install -g rpi-loop` works everywhere
2. **Basic Commands**: init, research, plan, implement
3. **Prompt Generation**: High-quality Claude Code prompts
4. **File Creation**: Simple ./rpi/ directory structure
5. **Error Messages**: Clear guidance when things go wrong

### Can Be Basic:
- **Templates**: Simple but effective (no customization)
- **Output**: Basic terminal output (minimal colors)
- **Testing**: End-to-end validation (skip unit tests)
- **Documentation**: Simple README (skip extensive docs)

### Skip Entirely:
- **Context Monitoring**: Add in v1.1
- **Session Management**: Add in v1.2
- **Advanced Features**: Add based on user feedback
- **Performance Optimization**: Not needed for MVP

## 🔥 Why This MVP Matters

This MVP validates a **fundamental question**:

**Can a simple tool make Claude Code significantly more effective?**

If YES:
- Proves RPI methodology value
- Justifies further investment
- Builds community for iteration
- Creates platform for thought leadership

If NO:
- Saves months of wasted effort
- Reveals what actually matters
- Enables rapid pivot
- Costs only 3 weeks to find out

## 🎉 Ready to Build MVP

This MVP specification enables **rapid validation** of:
- ✅ Core RPI methodology value
- ✅ Claude Code integration effectiveness
- ✅ Developer adoption potential
- ✅ Community interest level
- ✅ Future feature priorities

**Ship in 3 weeks. Learn from real users. Build what matters.**

---

## Quick MVP Implementation

1. **Start**: `implementation-todos-mvp.md` (32 tasks)
2. **Validate**: `mvp-success-criteria.md` (clear metrics)
3. **Build**: Week 1-2 focused development
4. **Test**: Week 3 with beta users
5. **Launch**: Week 4 public release

**Time to validate. Time to ship. Time to learn.**