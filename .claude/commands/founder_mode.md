# Founder Mode

You're working on an experimental feature that didn't get the proper ticketing and PR stuff set up.

Assuming you just made a commit, here are the next steps:

1. **Get the SHA of the commit you just made** (if you didn't make one, read `.claude/commands/commit.md` and make one)

2. **Read `.claude/commands/linear.md`** - think deeply about what you just implemented, then create a linear ticket about what you just did, and put it in 'in dev' state - it should have ### headers for "problem to solve" and "proposed solution"

3. **Fetch the ticket** to get the recommended git branch name

4. **git checkout main**

5. **git checkout -b 'BRANCHNAME'**

6. **git cherry-pick 'COMMITHASH'**

7. **git push -u origin 'BRANCHNAME'**

8. **gh pr create --fill**

9. **Read '.claude/commands/describe_pr.md'** and follow the instructions

## Purpose

This command helps transition experimental work into the proper development workflow by:
- Creating proper Linear tickets for tracking
- Setting up proper git branches
- Creating pull requests for code review
- Following established team processes

## When to Use

Use this command when:
- You've implemented something quickly without following normal processes
- You have working code that needs to be properly documented and reviewed
- You want to transition from experimental development to production-ready code
- You need to create the proper paper trail for your changes