# GitHub Issues Integration

This command provides comprehensive GitHub Issues management capabilities for development workflows.

## Core Features

- **Issue Creation**: Create new GitHub issues with proper formatting
- **Label Management**: Apply labels to track issue states and types
- **Comment Management**: Add detailed comments and updates
- **Issue Fetching**: Download issues with full context and comments
- **Workflow Integration**: Seamless integration with development processes

## Issue Creation Guidelines

### Format Requirements
- Use ### headers for main sections
- Include "Problem to Solve" section explaining the issue
- Include "Proposed Solution" section with implementation approach
- Provide clear acceptance criteria
- Reference related issues or documentation

### Label-Based Workflow States
Common workflow labels:
- **backlog**: Initial state for new ideas
- **ready-for-spec**: Needs planning and specification
- **planning**: Currently being planned
- **plan-review**: Plan completed, awaiting review
- **ready-for-dev**: Approved and ready for implementation
- **in-progress**: Currently being implemented
- **in-review**: Code review in progress
- **done**: Completed and merged

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
- Attach implementation plans to issues via comments or linked repositories
- Reference plan documents in issue descriptions
- Update issues when plans are modified

### With PRs
- Link PRs to issues using GitHub's closing keywords ("closes #123")
- Add PR links to issue comments when created
- Issues automatically close when linked PRs are merged

### With Development
- Apply "in-progress" label when starting implementation
- Provide regular updates on progress via comments
- Reference commits and branches in issue updates

## Command Usage

### Fetch Issues
- Download issues with full context including comments
- Save to `thoughts/shared/issues/issue-xxxx.md` format
- Include all relevant metadata and history

### Update Labels
- Apply workflow labels to track issue states
- Use GitHub CLI or API for label management
- Maintain clear workflow transitions

### Add Comments
- Provide concise, informative updates
- Include links to relevant resources
- Follow team communication standards

## Technical Integration

The GitHub Issues integration works with:
- **GitHub CLI (`gh`)**: For API interactions and issue management
- **Thoughts System**: For local issue storage
- **Development Workflow**: For status tracking via labels
- **Planning Process**: For linking specs and plans

## Best Practices

- **Be Specific**: Include concrete details and references
- **Stay Current**: Update issues regularly during development
- **Link Resources**: Connect issues to plans, PRs, and documentation
- **Use Labels Consistently**: Apply workflow labels to track progress
- **Cross-Reference**: Link related issues, PRs, and commits
- **Communicate Clearly**: Write comments that help teammates understand context

## GitHub CLI Commands

### Common Issue Management
```bash
# Create new issue
gh issue create --title "Issue Title" --body "Detailed description"

# List issues with labels
gh issue list --label "ready-for-spec"

# Add comment to issue
gh issue comment 123 --body "Progress update"

# Apply labels
gh issue edit 123 --add-label "in-progress"

# Close issue
gh issue close 123
```

This integration ensures GitHub Issues remain the source of truth for project status while enabling efficient development workflows.