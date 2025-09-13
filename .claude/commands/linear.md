# Linear Integration

This command provides comprehensive Linear ticket management capabilities for development workflows.

## Core Features

- **Ticket Creation**: Create new Linear tickets with proper formatting
- **Status Management**: Move tickets between workflow states
- **Comment Management**: Add detailed comments and updates
- **Ticket Fetching**: Download tickets with full context and comments
- **Workflow Integration**: Seamless integration with development processes

## Ticket Creation Guidelines

### Format Requirements
- Use ### headers for main sections
- Include "Problem to Solve" section explaining the issue
- Include "Proposed Solution" section with implementation approach
- Provide clear acceptance criteria
- Reference related tickets or documentation

### Status Transitions
Common workflow states:
- **Backlog**: Initial state for new ideas
- **Ready for Spec**: Needs planning and specification
- **Plan in Progress**: Currently being planned
- **Plan in Review**: Plan completed, awaiting review
- **Ready for Dev**: Approved and ready for implementation
- **In Dev**: Currently being implemented
- **In Review**: Code review in progress
- **Done**: Completed and merged

## Comment Guidelines

### Progress Updates
- Terse, factual updates about current status
- Link to relevant resources (PRs, plans, documentation)
- Include specific next steps or blockers

### Technical Details
- Reference specific files and line numbers
- Include error messages or diagnostic information
- Explain technical decisions and trade-offs

## Integration Patterns

### With Plans
- Attach implementation plans to tickets via links section
- Reference plan documents in comments
- Update tickets when plans are modified

### With PRs
- Add PR links to ticket comments when created
- Update ticket status based on PR status
- Cross-reference between tickets and PRs

### With Development
- Move tickets to "In Dev" when starting implementation
- Provide regular updates on progress
- Link to commits and branches

## Command Usage

### Fetch Tickets
- Download tickets with full context including comments
- Save to `thoughts/shared/tickets/ENG-xxxx.md` format
- Include all relevant metadata and history

### Update Status
- Move tickets between workflow states
- Trigger appropriate notifications
- Maintain audit trail of changes

### Add Comments
- Provide concise, informative updates
- Include links to relevant resources
- Follow team communication standards

## Technical Integration

The Linear integration works with:
- **MCP Tools**: For API interactions
- **Thoughts System**: For local ticket storage
- **Development Workflow**: For status tracking
- **Planning Process**: For linking specs and plans

## Best Practices

- **Be Specific**: Include concrete details and references
- **Stay Current**: Update tickets regularly during development
- **Link Resources**: Connect tickets to plans, PRs, and documentation
- **Follow Workflow**: Respect team processes and state transitions
- **Communicate Clearly**: Write comments that help teammates understand context

This integration ensures Linear tickets remain the source of truth for project status while enabling efficient development workflows.