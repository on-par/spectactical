# Research Phase Command

This command conducts thorough research on a given topic, validates the output using AI agents, and prepares for the planning phase.

## Usage
```bash
claude -p "/research <topic to research>"
```

## Process Overview

1. **Gather Requirements**: Ask clarifying questions (one at a time) until you understand the research task completely
2. **Conduct Research**: Use parallel agents to investigate thoroughly 
3. **Create Research Document**: Write comprehensive research output
4. **AI Validation Loop**: Spawn validation agent to score research (up to 3 iterations)
5. **Human Handoff**: Provide explicit next steps

## Phase 1: Requirements Gathering

**Ask clarifying questions ONE AT A TIME** until you have complete understanding:

- What specific problem or feature are we researching?
- What's the current state of the system?
- What are the success criteria?
- Are there specific constraints or requirements?
- What level of detail is needed?

**Do not proceed until you have enough context to conduct thorough research.**

## Phase 2: Research Execution

**Think deeply** about the research scope and break it into focused areas.

### Stage 1: Research Planning
Analyze the research requirements and identify key investigation areas:
- System architecture and components
- Existing implementations and patterns
- Technical constraints and dependencies
- Integration points and data flows
- Security and performance considerations
- Testing and quality requirements

### Stage 2: Parallel Investigation
Spawn multiple Task agents simultaneously for efficiency. Each agent should focus on a specific aspect:

**Example agent assignments:**
- **Architecture Agent**: "Investigate system architecture and key components related to [TOPIC]"
- **Implementation Agent**: "Find existing implementations and patterns for [SPECIFIC_AREA]"  
- **Integration Agent**: "Research integration points and data flows for [COMPONENT]"
- **Constraints Agent**: "Identify technical constraints, security, and performance requirements"

### Stage 3: Deep Analysis
For each investigation area:
- Read mentioned files fully before drawing conclusions
- Use Read, Grep, Glob tools through specialized agents
- Focus on concrete file paths and line numbers
- Document cross-component connections
- Identify architectural patterns and design decisions

### Stage 4: Synthesis
Combine findings from all parallel agents:
- Identify patterns and connections across components
- Document architectural insights and technical decisions
- Highlight important dependencies and constraints
- Note areas requiring further investigation

## Phase 3: Research Documentation

Create `thoughts/{ISSUE_ID}/research.md` with comprehensive findings:

```markdown
---
title: Research: [Topic Title]
date: {TODAY}
issue: {ISSUE_ID}
researchers: [list of agents used]
scope: [brief description of research scope]
---

# Research Summary
Brief overview of key findings and architectural insights

## Problem Statement
- What problem are we solving?
- Why does this matter?
- Current state vs desired state

## Key Findings
- Important discoveries from parallel investigation
- Architectural insights and patterns identified
- Critical technical decisions that impact implementation

## Component Analysis
### [Component 1] (`file:line`)
- Purpose and functionality
- Key dependencies and integration points
- Current behavior and limitations

### [Component 2] (`file:line`)
- Purpose and functionality  
- Key dependencies and integration points
- Current behavior and limitations

## Cross-Component Connections
- How components interact with each other
- Data flow patterns and processing pipelines
- Shared dependencies and coupling points
- Communication protocols and interfaces

## System Architecture
### Current Implementation
- Key files and components: `file:line`
- Directory structure and organization
- Design patterns and architectural decisions

### Dependencies
- External services and APIs
- Internal components and modules
- Data dependencies and storage
- Configuration and environment requirements

## Requirements Analysis
### Functional Requirements
- What the system must do
- User interactions and workflows
- Business logic and rules

### Technical Requirements
- Performance constraints and benchmarks
- Security requirements and compliance
- Scalability needs and growth patterns
- Quality attributes (reliability, maintainability)

## Risks & Considerations
- Potential technical issues and blockers
- Technical debt impacts and concerns
- Migration and deployment considerations
- Performance and scalability limitations

## Recommendations
- Technical suggestions for implementation approach
- Areas for improvement or optimization
- Best practices to follow
- Potential alternatives to consider

## Open Questions
- [ ] Items requiring clarification
- [ ] Technical decisions needed  
- [ ] Additional research required
- [ ] Stakeholder input needed
```

## Phase 4: AI Validation Loop - FARR Filter

Spawn a validation Task agent with this prompt:

```
Validate the research document at thoughts/{ISSUE_ID}/research.md using FARR criteria:

**FACTUAL**: Is all information accurate and verifiable? (0-5)
**ACTIONABLE**: Can this research lead to concrete next steps? (0-5) 
**RELIABLE**: Is the information consistent and trustworthy? (0-5)
**RELEVANT**: Does this address the original research question? (0-5)

Score each criteria 0-5 and provide average. Minimum 4.0 to pass.

Requirements check:
- [ ] Specific file references included (file:line format)
- [ ] Current system behavior documented comprehensively
- [ ] Integration points and cross-component connections identified
- [ ] Architectural patterns and design decisions explained
- [ ] All original research questions answered
- [ ] YAML frontmatter with metadata included
- [ ] Key findings and recommendations provided

Output format:
SCORES: F=X/5, A=X/5, R=X/5, R=X/5 | Average: X.X/5
STATUS: [PASS/FAIL]
ISSUES: [List any problems]
RECOMMENDATIONS: [Specific improvements needed]

Write validation results to thoughts/{ISSUE_ID}/research-validation.md
```

**Validation Loop Logic:**
- If validation score ≥ 4.0: Proceed to handoff
- If validation score < 4.0: Refine research based on feedback
- Maximum 3 research → validation cycles
- If still failing after 3 attempts, note limitations and proceed

## Phase 5: Human Handoff

When research passes validation, output:

```
✅ RESEARCH PHASE COMPLETE

Research document: thoughts/{ISSUE_ID}/research.md
Validation score: {SCORE}/5

Next step: Review the research document and run the following command when ready:

claude -p "/plan {ISSUE_ID}"

The planning phase will use this research to create a detailed implementation plan.
```

## Research Quality Standards

### Comprehensive Coverage
- Investigate all relevant aspects of the research question
- Document both obvious and subtle architectural connections  
- Include edge cases and error handling patterns
- Cover configuration, setup, and deployment requirements

### Precise Documentation
- Always include specific file paths and line numbers
- Preserve original directory structure in references
- Link to specific code sections and functions
- Use consistent formatting with YAML frontmatter

### Architectural Understanding
- Explain how components fit together in the system
- Document data flow patterns and processing pipelines
- Identify key design decisions and their rationale
- Note performance, scalability, and reliability considerations

## Important Guidelines

- **Ask questions ONE AT A TIME** - don't overwhelm with multiple questions
- **Use parallel Task agents** for complex investigations - spawn multiple specialized agents
- **Read files fully** before drawing conclusions - no skimming or assumptions
- **Include specific file references** - use `file:line` format consistently
- **Think deeply** at each phase before proceeding - understand before acting
- **Synthesize findings comprehensively** - connect insights from all agents
- **Maximum 3 validation cycles** - don't get stuck in infinite loops
- **End session after handoff** - let human review before next phase

The goal is to produce comprehensive, well-documented research that provides deep understanding of system architecture and enables confident planning and implementation.