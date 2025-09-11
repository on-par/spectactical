# GitHub Spec-Kit Research

## Overview

GitHub's Spec-Kit is a revolutionary open-source toolkit that fundamentally changes the approach to AI-assisted software development by implementing Spec-Driven Development (SDD). Instead of the traditional "vibe-coding" approach where developers prompt AI tools ad-hoc, Spec-Kit enforces a structured, specification-first methodology that treats specifications as executable, living artifacts.

## Core Philosophy

Spec-Kit **"flips the script"** on traditional software development by making specifications the primary driver rather than just scaffolding. The core principle is that **specifications become executable**, directly generating working implementations rather than just guiding them.

### Key Principles

1. **Intent-driven development** - Focus on the "what" before the "how"
2. **Rich specification creation** using guardrails and organizational principles
3. **Multi-step refinement** rather than one-shot code generation
4. **Heavy reliance** on advanced AI model capabilities for specification interpretation
5. **Specifications as the Lingua Franca** - The specification becomes the primary artifact

## Installation & Setup

### Prerequisites
- **Linux/macOS** (or WSL2 on Windows)
- AI coding agent: [Claude Code](https://www.anthropic.com/claude-code), [GitHub Copilot](https://code.visualstudio.com/), or [Gemini CLI](https://github.com/google-gemini/gemini-cli)
- [uv](https://docs.astral.sh/uv/) for package management
- [Python 3.11+](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads)

### Installation Command
```bash
uvx --from git+https://github.com/github/spec-kit.git specify init <PROJECT_NAME>
```

### Alternative Installation Options
```bash
# Initialize in current directory
specify init --here

# Specify AI agent directly
specify init --ai claude
specify init --ai gemini
specify init --ai copilot

# With current directory
specify init --here --ai claude

# Ignore agent tool checks
specify init --ai claude --ignore-agent-tools
```

## Development Phases

Spec-Kit organizes development into three primary phases:

| Phase | Focus | Key Activities |
|-------|-------|----------------|
| **0-to-1 Development** ("Greenfield") | Generate from scratch | Start with high-level requirements → Generate specifications → Plan implementation steps → Build production-ready applications |
| **Creative Exploration** | Parallel implementations | Explore diverse solutions → Support multiple technology stacks & architectures → Experiment with UX patterns |
| **Iterative Enhancement** ("Brownfield") | Modernization | Add features iteratively → Modernize legacy systems → Adapt processes |

## Core Commands

### `/specify` Command
Transforms feature descriptions into structured specifications. Focus on the **what** and **why**, not the tech stack.

**Example Usage:**
```bash
/specify Build an application that can help me organize my photos in separate photo albums. Albums are grouped by date and can be re-organized by dragging and dropping on the main page. Albums are never in other nested albums. Within each album, photos are previewed in a tile-like interface.
```

### `/plan` Command  
Provides tech stack and architecture choices to generate comprehensive technical plans.

**Example Usage:**
```bash
/plan The application uses Vite with minimal number of libraries. Use vanilla HTML, CSS, and JavaScript as much as possible. Images are not uploaded anywhere and metadata is stored in a local SQLite database.
```

### `/tasks` Command
Creates actionable task lists from the plan for implementation.

## Workflow Process

### Step 1: Bootstrap the Project
```bash
cd project_folder
claude  # or your preferred AI agent
```

Available commands: `/specify`, `/plan`, `/tasks`

### Step 2: Create Specification
Use `/specify` with detailed requirements focusing on:
- **What** you're building
- **Why** it's needed
- User journeys and experiences
- Success criteria

**Important:** Be explicit about requirements but avoid technical implementation details.

### Step 3: Generate Technical Plan
Use `/plan` to specify:
- Technology stack
- Architecture constraints
- Integration requirements
- Compliance needs

### Step 4: Task Breakdown and Implementation
Use `/tasks` to create actionable items, then implement iteratively.

## Project Structure

After initialization, the project structure includes:

```
├── memory/
│   ├── constitution.md
│   └── constitution_update_checklist.md
├── scripts/
│   ├── check-task-prerequisites.sh
│   ├── common.sh
│   ├── create-new-feature.sh
│   ├── get-feature-paths.sh
│   ├── setup-plan.sh
│   └── update-claude-md.sh
├── specs/
│   └── [feature-folders]/
│       ├── contracts/
│       ├── data-model.md
│       ├── plan.md
│       ├── quickstart.md
│       ├── research.md
│       └── spec.md
└── templates/
    ├── CLAUDE-template.md
    ├── plan-template.md
    ├── spec-template.md
    └── tasks-template.md
```

## Template Structures

### Spec Template Structure
1. **Header Section** - Feature name, branch, creation date, status
2. **Execution Flow** - Parsing, extraction, scenario generation
3. **Guidelines** - Focus on user needs, avoid implementation details
4. **User Scenarios & Testing** - Primary user story, acceptance scenarios, edge cases
5. **Requirements** - Functional requirements, key entities
6. **Review & Acceptance Checklist** - Quality checks, completeness validation
7. **Execution Status** - Processing tracking, completion markers

### Plan Template Structure
1. **Header** - Branch and date information, feature specification reference
2. **Execution Flow** - 7-step implementation planning process
3. **Technical Context** - Language, dependencies, storage, testing, platform, performance
4. **Constitution Check** - Simplicity, architecture, testing, observability, versioning
5. **Project Structure** - Source code organization options
6. **Phased Implementation** - Research, Design & Contracts, Task Planning Strategy
7. **Complexity Tracking** - Progress and deviation documentation

### Tasks Template Methodology
- **Systematic task generation** from design documents
- **Strict phase-based approach** (Setup → Tests → Core → Integration → Polish)
- **Test-Driven Development** methodology
- **Parallel task execution** where possible
- **Unique task IDs** with dependency tracking
- **Precise file path specification**

## Experimental Goals

### Technology Independence
- Create applications using diverse technology stacks
- Validate SDD as process-agnostic methodology

### Enterprise Constraints
- Support mission-critical application development
- Incorporate organizational constraints (cloud providers, tech stacks, engineering practices)
- Support enterprise design systems and compliance requirements

### User-Centric Development
- Build applications for different user cohorts and preferences
- Support various development approaches (vibe-coding to AI-native development)

### Creative & Iterative Processes
- Validate parallel implementation exploration
- Provide robust iterative feature development workflows
- Handle upgrades and modernization tasks

## Best Practices from Real Usage

### Specification Clarification
Always clarify requirements that weren't captured in the first attempt:
```text
For each sample project or project that you create there should be a variable number of tasks between 5 and 15 tasks for each one randomly distributed into different states of completion. Make sure that there's at least one task in each stage of completion.
```

### Validation Checklist
Use the Review & Acceptance Checklist to validate specifications:
```text
Read the review and acceptance checklist, and check off each item in the checklist if the feature spec meets the criteria. Leave it empty if it does not.
```

### Technical Research
For rapidly changing technologies, conduct targeted research:
```text
I want you to go through the implementation plan and implementation details, looking for areas that could benefit from additional research as .NET Aspire is a rapidly changing library.
```

### Plan Validation
Audit implementation plans for completeness:
```text
Now I want you to go and audit the implementation plan and the implementation detail files. Read through it with an eye on determining whether or not there is a sequence of tasks that you need to be doing that are obvious from reading this.
```

## Example Prompts

### Specification Creation
```text
Develop Taskify, a team productivity platform. It should allow users to create projects, add team members, assign tasks, comment and move tasks between boards in Kanban style. In this initial phase for this feature, let's call it "Create Taskify," let's have multiple users but the users will be declared ahead of time, predefined. I want five users in two different categories, one product manager and four engineers.
```

### Technical Planning
```text
We are going to generate this using .NET Aspire, using Postgres as the database. The frontend should use Blazor server with drag-and-drop task boards, real-time updates. There should be a REST API created with a projects API, tasks API, and a notifications API.
```

### Implementation
```text
implement specs/002-create-taskify/plan.md
```

## Benefits of Spec-Kit Approach

### Reliability
- Eliminates "vibe-coding" inconsistencies
- Provides structured, repeatable workflows
- Ensures alignment between intent and implementation

### Collaboration
- Creates shared source of truth
- Enables clear stakeholder communication
- Facilitates AI agent guidance

### Quality
- Enforces comprehensive requirement gathering
- Validates specifications before implementation
- Maintains living documentation

### Efficiency
- Reduces rework through upfront planning
- Enables parallel development streams
- Automates repetitive tasks

## Integration with AI Tools

Spec-Kit seamlessly integrates with major AI coding assistants:

- **Claude Code** - Native integration with `/specify`, `/plan`, `/tasks` commands
- **GitHub Copilot** - Template-driven development workflows
- **Gemini CLI** - Structured prompt engineering

## Community and Ecosystem

- **GitHub Repository**: https://github.com/github/spec-kit
- **License**: MIT open source
- **Maintainers**: Den Delimarsky (@localden), John Lam (@jflam)
- **Community**: Growing ecosystem of spec-driven development practitioners

## Troubleshooting

### Git Credential Manager on Linux
```bash
#!/usr/bin/env bash
set -e
echo "Downloading Git Credential Manager v2.6.1..."
wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.deb
echo "Installing Git Credential Manager..."
sudo dpkg -i gcm-linux_amd64.2.6.1.deb
echo "Configuring Git to use GCM..."
git config --global credential.helper manager
echo "Cleaning up..."
rm gcm-linux_amd64.2.6.1.deb
```

## Conclusion

GitHub's Spec-Kit represents a paradigm shift from ad-hoc AI prompting to structured, specification-driven development. By treating specifications as executable artifacts and central to the development process, it enables more reliable, maintainable, and collaborative software development with AI assistance.

The toolkit's strength lies in its systematic approach: clear phases, structured templates, and comprehensive workflows that guide both human developers and AI agents toward successful project outcomes. As AI coding capabilities continue to advance, Spec-Kit provides the necessary framework to harness that power effectively and reliably.