# Create Worktree for Implementation

This command sets up a git worktree for implementing a planned task, typically based on a Linear ticket and implementation plan.

## Process

1. **Parse input to extract Linear ticket ID**
   - Extract ticket number (e.g., ENG-123)
   - Use ticket ID to determine branch name

2. **Set up worktree for implementation:**
   - Read `hack/create_worktree.sh` and create a new worktree with the Linear branch name: `./hack/create_worktree.sh ENG-XXXX BRANCH_NAME`

3. **Determine required data:**
   - Branch name
   - Path to plan file (use relative path only)
   - Launch prompt
   - Command to run

**IMPORTANT PATH USAGE:**
- The thoughts/ directory is synced between the main repo and worktrees
- Always use ONLY the relative path starting with `thoughts/shared/...` without any directory prefix
- Example: `thoughts/shared/plans/fix-mcp-keepalive-proper.md` (not the full absolute path)
- This works because thoughts are synced and accessible from the worktree

4. **Confirm with the user by sending a message:**

```
Based on the input, I plan to create a worktree with the following details:

worktree path: ~/wt/humanlayer/ENG-XXXX
branch name: BRANCH_NAME
path to plan file: $FILEPATH
launch prompt:

    /implement_plan at $FILEPATH and when you are done implementing and all tests pass, read ./claude/commands/commit.md and create a commit, then read ./claude/commands/describe_pr.md and create a PR, then add a comment to the Linear ticket with the PR link

command to run:

    humanlayer launch --model opus -w ~/wt/humanlayer/ENG-XXXX "/implement_plan at $FILEPATH and when you are done implementing and all tests pass, read ./claude/commands/commit.md and create a commit, then read ./claude/commands/describe_pr.md and create a PR, then add a comment to the Linear ticket with the PR link"
```

Incorporate any user feedback then:

5. **Launch implementation session:**
   ```bash
   humanlayer launch --model opus -w ~/wt/humanlayer/ENG-XXXX "/implement_plan at $FILEPATH and when you are done implementing and all tests pass, read ./claude/commands/commit.md and create a commit, then read ./claude/commands/describe_pr.md and create a PR, then add a comment to the Linear ticket with the PR link"
   ```

## Important Notes

- Always use relative paths for plan files that start with `thoughts/shared/`
- The worktree script should handle the git setup and branch creation
- The launch command should include the full workflow: implement → test → commit → PR → Linear update
- Confirm all details with the user before executing the launch command

## Typical Workflow Integration

This command is typically used after:
1. Creating an implementation plan (`/create_plan`)
2. Saving the plan to the thoughts directory

And before:
1. Implementation work in the worktree
2. Testing and validation
3. Creating commits and PRs
4. Updating Linear tickets with progress