# The RPI Loop: Research-Plan-Implement Methodology

## Overview

The RPI Loop is a lightweight, systematic approach to software development that emphasizes iterative refinement at each stage before progression. It's designed to work seamlessly with AI-assisted development tools like Claude Code while maintaining human oversight and validation throughout the process.

## Core Philosophy

The RPI Loop inverts traditional development by front-loading critical thinking and planning before any implementation begins. It treats each phase as a specialized context with clear deliverables and validation checkpoints.

## The Three Phases

### Phase 1: Research (R)
**Objective**: Achieve expert-level understanding of the What and Why at high level

**Process**:
- Research the problem domain without getting into implementation details
- Focus on understanding the business problem, user needs, and constraints
- Define the problem space clearly and comprehensively
- Loop and refine until an AI agent becomes an expert on the topic
- Ensure all clarification questions are answered

**Output**: Comprehensive research document (markdown)
**Validation**: AI and/or human verification of research completeness and accuracy
**Completion Criteria**: No further updates needed to research after validation loop

### Phase 2: Plan (P)
**Objective**: Break down research into atomic, executable tasks

**Process**:
- Take the validated research and high-level design
- Decompose into atomic TODO tasks in markdown format: `- [ ] task description`
- Each task must be completable by a single command (CLI, create file, edit file, tool use, etc.)
- Loop over the plan until the entire research scope is fully planned
- Ensure that completing all TODOs would result in a deliverable feature/application

**Output**: Detailed TODO list (markdown)
**Validation**: AI and/or human verification that plan is complete and executable
**Completion Criteria**: Plan covers 100% of research scope with atomic tasks

### Phase 3: Implement (I)
**Objective**: Execute the validated plan systematically

**Process**:
- Run a command-line version of Claude Code with planned tasks as input
- Execute each TODO item sequentially
- Check off completed tasks
- Handle any unexpected issues or blockers
- Continue until all tasks are complete

**Output**: Working implementation
**Validation**: Functional testing and verification of deliverables
**Completion Criteria**: All TODOs checked off, feature/application is deliverable

## Key Principles

### Fresh Context per Loop
Each validation and update cycle runs in a fresh context to avoid context pollution and ensure objective evaluation.

### Validation at Every Stage
Every phase requires validation (AI and/or human) before progression to the next phase.

### Atomic Task Definition
Tasks in the Plan phase must be:
- Completable by a single command
- Clearly defined with no ambiguity
- Independent (no hidden dependencies)
- Testable/verifiable

### Lightweight and Frictionless
The system should be easy to:
- Set up and run
- Follow and understand
- Integrate with existing workflows
- Scale up or down based on project complexity

## Integration with Spec-Driven Development

The RPI Loop aligns naturally with Spec-Driven Development principles:

- **Research Phase** → Specification Creation
- **Plan Phase** → Specification Breakdown
- **Implement Phase** → Specification Execution

This creates a specification-first approach where the research becomes the living specification that drives the entire development process.

## Benefits

1. **Reduced Context Switching**: Each phase has a clear focus and deliverable
2. **Better Planning**: Front-loaded thinking prevents implementation surprises
3. **Validation Checkpoints**: Catch issues early before they compound
4. **AI-Friendly**: Structured approach works well with AI assistance
5. **Human Oversight**: Maintains human validation throughout the process
6. **Reproducible**: Clear methodology that can be repeated across projects

## Example Workflow

```
Research Loop:
├── Initial research → Research.md
├── Validation → Research-v2.md
├── Additional research → Research-v3.md
├── Final validation → ✓ Research complete

Plan Loop:
├── Initial plan → Plan.md
├── Validation → Plan-v2.md
├── Refinement → Plan-v3.md
├── Final validation → ✓ Plan complete

Implement Loop:
├── Execute TODO 1 → ✓
├── Execute TODO 2 → ✓
├── Execute TODO 3 → ✓
└── All TODOs complete → ✓ Implementation complete
```

## Implementation Notes

- Each phase should output markdown files for easy version control and collaboration
- Use standard markdown TODO syntax for maximum compatibility
- Validation can be automated using AI prompts or manual human review
- The system should integrate with existing development tools and workflows
- Consider using slash commands or CLI tools for easy execution

## Next Steps for Development

1. Define specific validation criteria for each phase
2. Create templates for research and planning documents
3. Develop CLI tools or slash commands for easy execution
4. Test the methodology on progressively complex projects
5. Refine based on real-world usage and feedback