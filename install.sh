#!/bin/bash

# RPI-Kit Installer
# One-line install: curl -sSL https://raw.githubusercontent.com/yourusername/rpi-kit/main/install.sh | bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
REPO="yourusername/rpi-kit"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/$REPO/$BRANCH"
RPI_DIR=".rpi"
VERSION="1.0.0"

# Parse arguments
AI_TOOL=""
while [[ $# -gt 0 ]]; do
    case $1 in
        --ai)
            AI_TOOL="$2"
            shift 2
            ;;
        --help)
            echo "RPI-Kit Installer"
            echo "Usage: curl -sSL $BASE_URL/install.sh | bash [-s -- options]"
            echo ""
            echo "Options:"
            echo "  --ai <tool>    Specify AI tool (claude, copilot, gemini)"
            echo "  --help         Show this help message"
            exit 0
            ;;
        *)
            shift
            ;;
    esac
done

# Header
echo ""
echo -e "${BLUE}================================================${NC}"
echo -e "${BLUE}       RPI-Kit - Research → Plan → Implement${NC}"
echo -e "${BLUE}================================================${NC}"
echo ""

# Check if .rpi already exists
if [ -d "$RPI_DIR" ]; then
    echo -e "${YELLOW}⚠️  .rpi directory already exists${NC}"
    read -p "Do you want to reinstall? This will backup existing work (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        # Backup existing work
        BACKUP_DIR=".rpi-backup-$(date +%Y%m%d-%H%M%S)"
        echo -e "${BLUE}📦 Backing up existing .rpi to $BACKUP_DIR${NC}"
        mv "$RPI_DIR" "$BACKUP_DIR"
    else
        echo -e "${RED}❌ Installation cancelled${NC}"
        exit 1
    fi
fi

# Detect AI tool if not specified
if [ -z "$AI_TOOL" ]; then
    echo -e "${BLUE}🔍 Detecting AI tool...${NC}"
    
    # Check for Claude Code
    if [ -d "$HOME/Library/Application Support/Claude" ] || [ -d "$HOME/.config/Claude" ]; then
        AI_TOOL="claude"
        echo -e "${GREEN}✓ Detected Claude Code${NC}"
    # Check for VS Code (might have Copilot)
    elif [ -d "$HOME/.vscode" ] || [ -d "$HOME/Library/Application Support/Code" ]; then
        AI_TOOL="copilot"
        echo -e "${GREEN}✓ Detected VS Code (assuming GitHub Copilot)${NC}"
    else
        # Ask user
        echo "Which AI tool are you using?"
        echo "1) Claude Code"
        echo "2) GitHub Copilot"
        echo "3) Google Gemini"
        read -p "Enter choice (1-3): " -n 1 -r
        echo
        case $REPLY in
            1) AI_TOOL="claude" ;;
            2) AI_TOOL="copilot" ;;
            3) AI_TOOL="gemini" ;;
            *) AI_TOOL="claude" ;; # Default
        esac
    fi
fi

echo -e "${BLUE}📥 Installing RPI-Kit for $AI_TOOL...${NC}"

# Create directory structure
echo -e "${BLUE}📁 Creating directory structure...${NC}"
mkdir -p "$RPI_DIR"/{templates,prompts/{claude,copilot,gemini},current,examples/api-rate-limiting}

# Download templates
echo -e "${BLUE}📄 Downloading templates...${NC}"

# Research template
cat > "$RPI_DIR/templates/research.md" << 'EOF'
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
### Functional Requirements
- What the system must do
- User-facing features
- Business logic requirements

### Technical Constraints
- Performance requirements
- Security requirements
- Compatibility requirements
- Technical limitations

## Success Criteria
- [ ] Measurable outcome 1
- [ ] Measurable outcome 2
- [ ] Measurable outcome 3

## Open Questions
- [ ] Questions that need answers before planning
- [ ] Technical unknowns
- [ ] Decisions to be made

## Context & Notes
<!-- Any additional context, links, or notes -->
EOF

# Plan template
cat > "$RPI_DIR/templates/plan.md" << 'EOF'
# Implementation Plan: [TOPIC]

## Strategy
<!-- High-level approach based on research -->

## Phase 1: [Name]
<!-- Group related tasks that can be done together -->
- [ ] Task 1 (atomic, can be completed in one AI session)
- [ ] Task 2 (atomic, can be completed in one AI session)
- [ ] Task 3 (atomic, can be completed in one AI session)

## Phase 2: [Name]
- [ ] Task 4 (atomic, can be completed in one AI session)
- [ ] Task 5 (atomic, can be completed in one AI session)

## Phase 3: [Name]
- [ ] Task 6 (atomic, can be completed in one AI session)
- [ ] Task 7 (atomic, can be completed in one AI session)

## Testing Strategy
- Unit tests needed
- Integration tests needed
- Manual testing checklist

## Risk Mitigation
- **Risk 1**: [Description] → Mitigation: [Approach]
- **Risk 2**: [Description] → Mitigation: [Approach]

## Dependencies
- External dependencies
- Order of implementation
- Blocking factors
EOF

# Implementation template
cat > "$RPI_DIR/templates/implement.md" << 'EOF'
# Implementation Progress: [TOPIC]

## Status Overview
- **Current Phase**: X of Y
- **Completed Tasks**: X of Y  
- **Current Focus**: [Current task/phase name]
- **Blockers**: None / [List any blockers]

## Completed Tasks
- [x] Task 1 - [Brief outcome/notes]
- [x] Task 2 - [Brief outcome/notes]

## In Progress
- [ ] Current task: [Detailed description]
  - Approach: [How you're implementing]
  - Status: [What's done, what's left]
  - Notes: [Any important details]

## Upcoming Tasks
- [ ] Next task 1
- [ ] Next task 2

## Deviations from Plan
<!-- Document any changes from original plan and why -->
- [If any] Changed X because Y

## Test Results
<!-- Track testing as you go -->
- [ ] Unit tests for Phase 1
- [ ] Integration tests for Phase 1
- [ ] Manual testing checklist

## Notes & Learnings
<!-- Capture important discoveries or decisions made during implementation -->
EOF

# Create AI-specific prompts
echo -e "${BLUE}🤖 Creating AI-specific prompts...${NC}"

# Claude prompts
cat > "$RPI_DIR/prompts/claude/research.md" << 'EOF'
I need to research a new feature/task for implementation. Please help me fill out this research template following the RPI (Research → Plan → Implement) methodology.

The topic is: [PASTE YOUR TOPIC HERE]

Important guidelines:
- Focus on understanding the problem deeply without jumping to implementation
- Include specific file:line references where relevant for existing code
- Be thorough but stay at the conceptual level
- We'll plan implementation details in the next phase

Here's the template to fill out:

[PASTE TEMPLATE FROM .rpi/templates/research.md]
EOF

cat > "$RPI_DIR/prompts/claude/plan.md" << 'EOF'
Based on the research phase, I need to create an implementation plan. Please help me create a detailed, actionable plan with atomic tasks.

Here's the completed research:

[PASTE YOUR RESEARCH FROM .rpi/current/research.md]

Now, please create an implementation plan using this template. Each task should be:
- Atomic (completable in one coding session)
- Specific and actionable
- Properly sequenced with dependencies

Template:

[PASTE TEMPLATE FROM .rpi/templates/plan.md]
EOF

cat > "$RPI_DIR/prompts/claude/implement.md" << 'EOF'
I'm in the implementation phase of the RPI methodology. Please help me implement the next task from my plan.

Here's my plan:

[PASTE YOUR PLAN FROM .rpi/current/plan.md]

And here's my current progress:

[PASTE YOUR PROGRESS FROM .rpi/current/progress.md]

Please help me implement the next uncompleted task. Focus on:
- Following the plan exactly
- Writing clean, maintainable code
- Including appropriate tests
- Documenting any deviations if necessary
EOF

# Copilot prompts
cat > "$RPI_DIR/prompts/copilot/research.md" << 'EOF'
# Research Phase - RPI Methodology

I need help researching a feature before implementation. This is the RESEARCH phase where we understand the problem without coding.

**Topic**: [PASTE YOUR TOPIC HERE]

**Instructions**:
- Focus on WHAT and WHY, not HOW
- Include file:line references for existing code
- Don't suggest implementation yet
- Be thorough in understanding requirements

Please fill out this template:

[PASTE TEMPLATE FROM .rpi/templates/research.md]
EOF

cat > "$RPI_DIR/prompts/copilot/plan.md" << 'EOF'
# Planning Phase - RPI Methodology

Based on our research, let's create an implementation plan with atomic tasks.

**Completed Research**:

[PASTE YOUR RESEARCH FROM .rpi/current/research.md]

**Instructions**:
- Break down into atomic tasks (one session each)
- Sequence tasks properly
- Include testing strategy
- Identify risks

Fill out this template:

[PASTE TEMPLATE FROM .rpi/templates/plan.md]
EOF

cat > "$RPI_DIR/prompts/copilot/implement.md" << 'EOF'
# Implementation Phase - RPI Methodology

Let's implement the next task from our plan.

**Current Plan**:

[PASTE YOUR PLAN FROM .rpi/current/plan.md]

**Current Progress**:

[PASTE YOUR PROGRESS FROM .rpi/current/progress.md]

Help me implement the next uncompleted task, focusing on clean code and testing.
EOF

# Gemini prompts
cat > "$RPI_DIR/prompts/gemini/research.md" << 'EOF'
I'm using the RPI (Research → Plan → Implement) methodology. This is the RESEARCH phase.

**Topic to research**: [PASTE YOUR TOPIC HERE]

**Your task**: Help me understand this problem thoroughly without proposing solutions yet.

**Guidelines**:
- Focus on requirements and constraints
- Include specific file paths and line numbers for existing code
- Stay at the conceptual level
- Be comprehensive and factual

Please complete this research template:

[PASTE TEMPLATE FROM .rpi/templates/research.md]
EOF

cat > "$RPI_DIR/prompts/gemini/plan.md" << 'EOF'
I'm using the RPI methodology. This is the PLANNING phase.

**Research from previous phase**:

[PASTE YOUR RESEARCH FROM .rpi/current/research.md]

**Your task**: Create a detailed implementation plan based on this research.

**Requirements**:
- Break work into atomic tasks
- Each task should be completable in one session
- Include testing and risk mitigation
- Maintain logical sequencing

Complete this planning template:

[PASTE TEMPLATE FROM .rpi/templates/plan.md]
EOF

cat > "$RPI_DIR/prompts/gemini/implement.md" << 'EOF'
I'm using the RPI methodology. This is the IMPLEMENTATION phase.

**Implementation Plan**:

[PASTE YOUR PLAN FROM .rpi/current/plan.md]

**Current Progress**:

[PASTE YOUR PROGRESS FROM .rpi/current/progress.md]

**Your task**: Help me implement the next uncompleted task from the plan. Provide clean, tested code that follows the plan exactly.
EOF

# Create README
cat > "$RPI_DIR/README.md" << EOF
# RPI-Kit Quick Reference

## Your AI Tool: $AI_TOOL

## Workflow

### 1. Research Phase
1. Define your topic in \`.rpi/current/topic.txt\`
2. Copy \`.rpi/prompts/$AI_TOOL/research.md\` to your AI tool
3. Save the response to \`.rpi/current/research.md\`

### 2. Planning Phase  
1. Copy your research + \`.rpi/prompts/$AI_TOOL/plan.md\` to your AI tool
2. Save the response to \`.rpi/current/plan.md\`

### 3. Implementation Phase
1. Copy your plan + \`.rpi/prompts/$AI_TOOL/implement.md\` to your AI tool
2. Update \`.rpi/current/progress.md\` as you work
3. Repeat until all tasks are complete

## Structure
- \`templates/\` - Base templates for each phase
- \`prompts/\` - AI-specific prompts
- \`current/\` - Your active work
- \`examples/\` - Example RPI cycles

## Tips
- Keep research high-level (no implementation details)
- Make tasks atomic (one AI session each)
- Update progress.md after each task
- Check examples/ for guidance

Version: $VERSION
EOF

# Create VERSION file
echo "$VERSION" > "$RPI_DIR/VERSION"

# Create initial files
touch "$RPI_DIR/current/topic.txt"
touch "$RPI_DIR/current/research.md"
touch "$RPI_DIR/current/plan.md"
touch "$RPI_DIR/current/progress.md"

# Success message
echo ""
echo -e "${GREEN}✅ RPI-Kit installed successfully!${NC}"
echo ""
echo -e "${BLUE}📍 Location: $(pwd)/$RPI_DIR${NC}"
echo -e "${BLUE}🤖 Configured for: $AI_TOOL${NC}"
echo ""
echo -e "${YELLOW}🚀 Quick Start:${NC}"
echo "  1. Add your topic to: .rpi/current/topic.txt"
echo "  2. Copy .rpi/prompts/$AI_TOOL/research.md to $AI_TOOL"
echo "  3. Save response to .rpi/current/research.md"
echo ""
echo "  See .rpi/README.md for complete workflow"
echo ""
echo -e "${GREEN}Happy building with RPI! 🎉${NC}"
echo ""