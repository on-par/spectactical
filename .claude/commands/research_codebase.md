# Research Codebase

This command provides a comprehensive methodology for conducting thorough research across a codebase using parallel sub-agents and synthesizing findings.

## Process Overview

1. **Initial Setup**: Understand research requirements and scope
2. **Analyze Research Questions**: Break down the research into specific areas
3. **Spawn Parallel Sub-Agent Tasks**: Use specialized agents for different aspects
4. **Synthesize Findings**: Combine results into coherent insights
5. **Generate Research Document**: Create structured documentation
6. **Add GitHub Permalinks**: Include permanent links to code references
7. **Sync and Present Results**: Deliver findings and handle follow-up

## Key Principles

### Parallel Investigation
- Use multiple Task agents simultaneously for efficiency
- Spawn focused sub-tasks for different research aspects
- Coordinate findings from multiple specialized agents

### Detailed Documentation
- Focus on concrete file paths and line numbers
- Explore cross-component connections
- Maintain consistent documentation format
- Preserve directory structure when referencing paths

### Systematic Approach
- Read mentioned files fully before creating sub-tasks
- Create focused, specific sub-tasks
- Synthesize findings comprehensively
- Document with precise metadata

## Research Methodology

### Stage 1: Analysis
- Understand the research question completely
- Identify key areas that need investigation
- Plan parallel research tasks

### Stage 2: Investigation
- Spawn multiple Task agents with specific research goals
- Use appropriate tools (Read, Grep, Glob, LS) through agents
- Focus each agent on a specific aspect of the research

### Stage 3: Synthesis
- Combine findings from all sub-agents
- Identify patterns and connections across components
- Document architectural insights
- Highlight important technical decisions

### Stage 4: Documentation
- Create structured research document
- Include specific file references and line numbers
- Add GitHub permalinks for permanent references
- Use consistent format with YAML frontmatter

## Documentation Structure

```yaml
---
title: Research Title
date: YYYY-MM-DD
ticket: ISSUE-XXXX (if applicable)
researchers: [agent names used]
scope: [brief description of research scope]
---

# Research Summary
Brief overview of findings

## Key Findings
- Important discoveries
- Architectural insights
- Technical constraints

## Component Analysis
### Component 1 ([file:line])
- Purpose and functionality
- Key dependencies
- Integration points

## Cross-Component Connections
- How components interact
- Data flow patterns
- Shared dependencies

## Recommendations
- Technical suggestions
- Areas for improvement
- Further research needed
```

## Quality Standards

### Comprehensive Coverage
- Investigate all relevant aspects
- Document both obvious and subtle connections
- Include edge cases and error handling
- Cover configuration and setup requirements

### Precise References
- Always include file paths and line numbers
- Use GitHub permalinks for permanent references
- Preserve original directory structure
- Link to specific code sections

### Architectural Understanding
- Explain how components fit together
- Document data flow and processing
- Identify key design decisions
- Note performance and scalability considerations

## Tools and Techniques

### Sub-Agent Coordination
- Use Task tool to spawn specialized research agents
- Assign specific research goals to each agent
- Coordinate findings across multiple investigations

### Code Analysis
- Use Read tool for detailed file examination
- Use Grep for pattern and keyword searches
- Use Glob for file discovery and organization
- Use LS for directory structure understanding

### Documentation Best Practices
- Create self-contained research documents
- Include all necessary context and background
- Use clear, consistent formatting
- Provide actionable insights and recommendations

The goal is to produce comprehensive, well-documented research that provides deep understanding of codebase architecture, implementation patterns, and technical decisions.