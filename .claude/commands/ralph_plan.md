# Ralph Planning

This command creates implementation plans by selecting from Linear tickets that are ready for specification and following a structured planning workflow.

## Process Overview

### Part I - Ticket Selection

#### If a ticket is mentioned:
- Use `linear` CLI to fetch the selected item into thoughts: `./thoughts/shared/tickets/ENG-xxxx.md`
- Read the ticket and all comments to learn about past implementations, research, and any questions or concerns

#### If no ticket is mentioned:
1. Read `.claude/commands/linear.md`
2. Fetch the top 10 priority items from Linear in status "ready for spec" using MCP tools, noting all items in the `links` section
3. Select the highest priority SMALL or XS issue from the list (if no SMALL or XS issues exist, EXIT IMMEDIATELY and inform the user)
4. Use `linear` CLI to fetch the selected item into thoughts: `./thoughts/shared/tickets/ENG-xxxx.md`
5. Read the ticket and all comments to learn about past implementations, research, and any questions or concerns

### Part II - Plan Creation

**Think deeply** before proceeding.

1. **Move the item to "plan in progress"** using the MCP tools
2. **Read `./claude/commands/create_plan.md`** for planning methodology
3. **Determine if the item has a linked implementation plan** document based on the `links` section
4. **If the plan exists**, you're done - respond with a link to the ticket
5. **If the research is insufficient or has unanswered questions**, create a new plan document following the instructions in `./claude/commands/create_plan.md`

**Think deeply** about the implementation requirements.

6. **When the plan is complete**: 
   - Run `humanlayer thoughts sync`
   - Attach the document to the ticket using the MCP tools
   - Create a terse comment with a link to it (re-read `.claude/commands/linear.md` if needed)
7. **Move the item to "plan in review"** using the MCP tools

### Part III - Completion

When you're done, print a message for the user (replace placeholders with actual values):

```
Planning complete for [TICKET_NUMBER]: [TICKET_TITLE]

Status: Moved to "Plan in Review"
Plan Document: [LINK_TO_PLAN]
Linear Ticket: [LINK_TO_TICKET]

The implementation plan is ready for review. Once approved, the ticket can move to "Ready for Dev" status.
```

## Important Guidelines

- **Think deeply** - Take time to understand the full context and requirements
- **Use TodoWrite** to track your planning tasks
- **Work on ONE item only** - Select the highest priority SMALL or XS sized issue
- **Follow structured planning** - Use the methodology in `create_plan.md`

## Quality Criteria

### Ticket Selection
- Must be SMALL or XS sized for manageability
- Must be highest priority among available options
- Must be in "ready for spec" status

### Plan Requirements
- Comprehensive research and analysis
- Clear implementation phases
- Specific success criteria (automated and manual)
- Risk assessment and mitigation
- Integration with existing architecture

## Workflow Integration

This command bridges the gap between:
1. **Initial Requirements**: Raw ticket descriptions
2. **Technical Planning**: Detailed implementation roadmaps
3. **Development Ready**: Tickets prepared for implementation

The goal is to create thorough, actionable implementation plans that enable efficient development while ensuring all requirements and constraints are properly addressed.