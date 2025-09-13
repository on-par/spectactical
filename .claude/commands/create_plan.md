# Create Implementation Plan

This command creates a detailed implementation plan using an iterative, collaborative approach. The plan will be comprehensive, actionable, and based on thorough research.

## Process Overview

1. **Context Gathering & Initial Analysis**
2. **Research & Discovery** 
3. **Plan Structure Development**
4. **Detailed Plan Writing**
5. **Sync and Review**

## Key Principles

- **Be skeptical and thorough** - don't accept things at face value
- **Work collaboratively** - involve the user in the planning process
- **Read all context completely** - don't skim documentation or tickets
- **Spawn parallel research** - use multiple specialized agents simultaneously
- **Create detailed, actionable plans** - be specific about implementation steps
- **Include clear success criteria** - both automated and manual verification

## Implementation Methodology

### Stage 1: Context Gathering
- Read and understand the full context (tickets, documentation, etc.)
- Identify key stakeholders and requirements
- Understand current system state and constraints

### Stage 2: Research & Discovery
- Spawn parallel research tasks using specialized agents
- Investigate technical requirements and dependencies
- Research existing implementations and patterns
- Identify potential risks and challenges

### Stage 3: Plan Structure Development
- Create high-level implementation phases
- Define success criteria and verification steps
- Identify automated vs manual verification requirements
- Plan testing and validation approach

### Stage 4: Detailed Plan Writing
- Write comprehensive implementation steps
- Include specific file changes and code modifications
- Document configuration and deployment requirements
- Plan for edge cases and error handling

### Stage 5: Sync and Review
- Present plan to user for feedback
- Iterate based on user input
- Refine and finalize implementation approach

## Plan Template Structure

```markdown
# Implementation Plan: [Title]

## Overview
Brief description of what needs to be implemented

## Current State Analysis
What exists today and what needs to change

## Desired End State
Clear description of the target outcome

## Implementation Approach
High-level strategy and methodology

## Phased Implementation

### Phase 1: [Phase Name]
- Specific steps
- Files to modify
- Success criteria

### Phase 2: [Phase Name]
- Next set of steps
- Dependencies on previous phases
- Validation approach

## Testing Strategy
- Automated tests to write/modify
- Manual verification steps
- Integration testing approach

## Performance Considerations
- Expected performance impact
- Monitoring and metrics
- Optimization opportunities

## Migration Notes
- Data migration requirements
- Backward compatibility considerations
- Rollback procedures

## Success Criteria

### Automated Verification
- Unit tests pass
- Integration tests pass
- Performance benchmarks met

### Manual Verification
- Feature works as expected
- User experience is improved
- No regressions introduced

## Open Questions
- Items requiring further research
- Decisions pending user input
- Risks to investigate further
```

## Guidelines for Spawning Sub-tasks

- Use specialized research agents for complex investigations
- Spawn multiple tasks in parallel for efficiency
- Be specific about what each sub-task should investigate
- Coordinate findings from multiple sub-tasks into cohesive plan

## Success Criteria Guidelines

### Automated Verification
- Should be checkable by running commands
- Include specific test commands to run
- Define expected outputs/results

### Manual Verification  
- Should be actionable steps a human can follow
- Include specific UI interactions to test
- Define expected user experience outcomes

## Change Type Considerations

### Database Changes
- Migration scripts required
- Schema evolution considerations
- Data integrity verification

### New Features
- Integration points with existing system
- Configuration requirements
- Documentation updates needed

### Refactoring
- Backward compatibility requirements
- Testing strategy for unchanged behavior
- Performance impact assessment

## Collaboration Approach

- Present initial findings and ask for user input
- Iterate on plan structure based on feedback
- Confirm implementation approach before finalizing
- Track open questions and resolve through discussion

The goal is to produce a comprehensive, well-researched implementation plan that can be executed incrementally with clear success milestones.