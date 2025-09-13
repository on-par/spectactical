# Ralph Research

This command conducts research on Linear tickets that require investigation and creates comprehensive research documents to inform future planning.

## Process Overview

### Part I - Ticket Selection

#### If a Linear ticket is mentioned:
- Use `linear` CLI to fetch the selected item into thoughts: `./thoughts/shared/tickets/ENG-xxxx.md`
- Read the ticket and all comments to understand what research is needed and any previous attempts

#### If no ticket is mentioned:
1. Read `.claude/commands/linear.md`
2. Fetch the top 10 priority items from Linear in status "research needed" using MCP tools, noting all items in the `links` section
3. Select the highest priority SMALL or XS issue from the list (if no SMALL or XS issues exist, EXIT IMMEDIATELY and inform the user)
4. Use `linear` CLI to fetch the selected item into thoughts: `./thoughts/shared/tickets/ENG-xxxx.md`
5. Read the ticket and all comments to understand what research is needed and any previous attempts

### Part II - Research Execution

**Think deeply** before proceeding.

1. **Move the item to "research in progress"** using the MCP tools
2. **Read any linked documents** in the `links` section to understand context
3. **If insufficient information** to conduct research, add a comment asking for clarification and move back to "research needed"

**Think deeply about the research needs**

4. **Conduct the research**:
   - Read `.claude/commands/research_codebase.md` for guidance on effective codebase research
   - If Linear comments suggest web research is needed, use WebSearch to research external solutions, APIs, or best practices
   - Search the codebase for relevant implementations and patterns
   - Examine existing similar features or related code
   - Identify technical constraints and opportunities
   - **Be unbiased** - don't think too much about an ideal implementation plan, just document all related files and how the systems work today
   - Document findings in a new thoughts document: `thoughts/shared/research/YYYY-MM-DD-ENG-XXXX-description.md`

## Research Documentation Format

**Filename Format**: `YYYY-MM-DD-ENG-XXXX-description.md` where:
- `YYYY-MM-DD` is today's date
- `ENG-XXXX` is the Linear ticket number
- `description` is a brief description of the research topic

## Research Quality Standards

### Comprehensive Investigation
- Examine all relevant code paths and components
- Document existing implementations and patterns
- Identify integration points and dependencies
- Research external solutions when applicable

### Unbiased Documentation
- Focus on documenting current system behavior
- Avoid premature solution design
- Document both opportunities and constraints
- Include technical debt and limitations

### Actionable Insights
- Provide clear findings that inform planning
- Identify specific files and code locations
- Document APIs, interfaces, and data flows
- Note potential risks and considerations

## Workflow Integration

This command feeds into:
1. **Planning Phase**: Research informs implementation planning
2. **Architecture Decisions**: Research influences technical choices
3. **Risk Assessment**: Research identifies potential challenges
4. **Solution Design**: Research provides foundation for specifications

## Important Guidelines

- **Think deeply** about research requirements before starting
- **Be thorough** in investigating all relevant aspects
- **Document objectively** without bias toward specific solutions
- **Focus on facts** about current system behavior
- **Work on ONE item only** - Select highest priority SMALL or XS issue

The goal is to create comprehensive, unbiased research documentation that enables informed planning and decision-making for future development work.