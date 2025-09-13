# Ralph Implementation

This command implements features by selecting from ready-to-develop Linear tickets and following the complete development workflow.

## Process Overview

### Part I - Ticket Selection

#### If a ticket is mentioned:
- Use `linear` CLI to fetch the selected item into thoughts: `./thoughts/shared/tickets/ENG-xxxx.md`
- Read the ticket and all comments to understand the implementation plan and any concerns

#### If no ticket is mentioned:
1. Read `.claude/commands/linear.md`
2. Fetch the top 10 priority items from Linear in status "ready for dev" using MCP tools, noting all items in the `links` section
3. Select the highest priority SMALL or XS issue from the list (if no SMALL or XS issues exist, EXIT IMMEDIATELY and inform the user)
4. Use `linear` CLI to fetch the selected item into thoughts: `./thoughts/shared/tickets/ENG-xxxx.md`
5. Read the ticket and all comments to understand the implementation plan and any concerns

### Part II - Implementation Setup

**Think deeply** before proceeding.

1. **Move the item to "in dev"** using the MCP tools
2. **Identify the linked implementation plan** document from the `links` section
3. **If no plan exists**, move the ticket back to "ready for spec" and EXIT with an explanation

**Think deeply about the implementation**

4. **Set up worktree for implementation**:
   - Read `hack/create_worktree.sh` and create a new worktree with the Linear branch name: `./hack/create_worktree.sh ENG-XXXX BRANCH_NAME`
   - Launch implementation session: `npx humanlayer launch --model opus --dangerously-skip-permissions -w ~/wt/humanlayer/ENG-XXXX "/implement_plan and when you are done implementing and all tests pass, read ./claude/commands/commit.md and create a commit, then read ./claude/commands/describe_pr.md and create a PR, then add a comment to the Linear ticket with the PR link"`

## Important Guidelines

- **Think deeply** - Take time to understand the full context before acting
- **Use TodoWrite** to track your tasks throughout the process
- **Work on ONE item only** - Select the highest priority SMALL or XS sized issue
- **Follow the complete workflow** - Don't skip steps in the implementation process

## Quality Criteria

### Ticket Selection
- Must be SMALL or XS sized for manageability
- Must be highest priority among available options
- Must have an implementation plan already created

### Implementation Requirements
- Complete implementation following the plan
- All tests must pass
- Proper commit messages following team standards
- Comprehensive PR descriptions
- Linear ticket updated with progress

## Workflow Integration

This command provides end-to-end implementation workflow:
1. **Ticket Selection**: Choose appropriate work items
2. **Environment Setup**: Create isolated worktree for development
3. **Implementation**: Follow approved plans
4. **Quality Gates**: Testing and verification
5. **Delivery**: Commits, PRs, and ticket updates

The goal is to deliver complete, tested features while maintaining high standards for code quality and project tracking.