# Rapid Prototype System Analysis
*Based on Dex's proven 35k LOC/month methodology*

## The Secret: Why Dex Ships Without Reading Code

After analyzing your `.claude/commands/` structure, the pattern is clear:

1. **Context Isolation** - Each phase runs in fresh context (<40% utilization)
2. **Parallel Research** - Multiple specialized agents investigate simultaneously
3. **Document Review, Not Code Review** - Humans review markdown plans, not implementation
4. **"Think Deeply" Directives** - Forces AI to understand before acting
5. **Atomic Tasks** - Each implementation task is a single command/edit

## The Three-Phase Pattern

### Research Phase (`ralph_research.md` pattern)
- Spawns parallel agents to investigate
- Produces markdown research document
- Human reviews understanding, not code
- Output: `research/[topic].md`

### Plan Phase (`ralph_plan.md` pattern)
- Reads research document
- Creates detailed implementation plan
- Breaks into atomic tasks with checkboxes
- Human approves plan, not implementation
- Output: `plans/[topic].md`

### Implement Phase (`ralph_impl.md` pattern)
- Reads approved plan
- Executes atomic tasks mechanically
- Updates checkboxes as completed
- Tests after each phase
- Output: Working code

## Why This Works at Scale

**Traditional Approach:**
- Human: "Add authentication"
- AI: *Generates 2000 lines of code*
- Human: *Tries to review 2000 lines*
- Result: Bugs, confusion, rewrites

**Dex's Approach:**
- Human: Reviews 50-line research doc ("This is how auth works today")
- Human: Reviews 100-line plan ("Here's what we'll change")
- AI: Mechanically implements validated plan
- Result: Predictable, correct implementation

## Client-Focused Rapid Prototype System

### Requirements
- Small budget (no full dev team)
- Junior devs using Claude Code
- Client hosts on Azure/AWS
- <1 month to working prototype

### The System: "RPI-Client"

```
client-project/
├── .rpi/
│   ├── commands/           # Three core commands
│   │   ├── research.md     # Research phase prompt
│   │   ├── plan.md         # Planning phase prompt
│   │   └── implement.md    # Implementation prompt
│   ├── current/            # Current sprint work
│   │   ├── research.md     # This sprint's research
│   │   ├── plan.md         # This sprint's plan
│   │   └── progress.md     # Implementation tracking
│   ├── archive/            # Previous sprints
│   │   └── sprint-1/
│   │       ├── research.md
│   │       ├── plan.md
│   │       └── progress.md
│   └── templates/          # Client-specific templates
│       ├── azure-deploy.md
│       ├── aws-deploy.md
│       └── testing-checklist.md
```

### Week-by-Week Breakdown

**Week 1: Discovery & First Feature**
- Day 1-2: Client requirements → research.md
- Day 3: Research review with client
- Day 4: Plan creation → plan.md
- Day 5: Plan review & approval

**Week 2-3: Core Implementation**
- Junior devs execute plan.md tasks
- Daily progress updates in progress.md
- Client reviews progress, not code
- Deploy to staging on Azure/AWS

**Week 4: Polish & Deploy**
- Final features from updated plan
- Client UAT on staging
- Production deployment
- Handoff documentation

### Key Differences for Client Work

1. **Client Reviews Documents, Not Code**
   - They understand "User Registration Flow" document
   - They can't review React components

2. **Junior Devs Follow Plans, Not Instincts**
   - Plan says "Create UserAuth component"
   - Junior dev copies plan task to Claude Code
   - Claude implements exactly that

3. **Progress Tracking in Plain English**
   - "✅ User can register with email"
   - "⬜ Password reset flow"
   - Client sees progress daily

4. **Deployment Templates Included**
   - Pre-configured for Azure/AWS
   - Junior devs just follow checklist
   - No DevOps expertise needed

## The Commands You Need

### 1. `research.md` - Discovery Phase
```markdown
# Research: [Client Feature]

## Client Requirements
Read the requirements document and understand what the client needs.

## Technical Investigation
**Think deeply** about the technical requirements.

Spawn parallel research tasks to investigate:
- Existing similar solutions
- Required integrations (payment, auth, etc.)
- Data models needed
- UI/UX patterns

## Deliverable
Create a research document that the CLIENT can understand:
- What we're building (in plain English)
- How it will work (high level)
- What services we'll use
- Estimated complexity
```

### 2. `plan.md` - Planning Phase
```markdown
# Plan: [Client Feature]

Read the approved research document.

## Create Implementation Plan

**Think deeply** about the implementation.

Break down into phases with atomic tasks:
- Each task = one Claude Code prompt
- Each task has clear success criteria
- Tasks a junior dev can execute

## Success Criteria
For each phase, define:
- What the client will see working
- How to test it
- What could go wrong

## Deliverable
A plan document the client can approve with:
- Clear phases (Week 1, Week 2, etc.)
- Specific deliverables per phase
- Testing approach
```

### 3. `implement.md` - Execution Phase
```markdown
# Implement: [Client Feature]

Read the approved plan document.

## Execute Plan
- Work through tasks in order
- Update progress.md after each task
- Test after each phase
- Deploy to staging when phase complete

## Junior Dev Instructions
For each task:
1. Copy task description from plan
2. Paste into Claude Code
3. Run tests
4. Update progress.md
5. Commit with task number

## Client Communication
Update progress.md with:
- ✅ Completed features (client-friendly language)
- 🔄 In progress
- ⬜ Upcoming
- 🚨 Any blockers
```

## Why This Will Work

1. **Proven Methodology** - Dex's team validates on 300k+ LOC
2. **Client-Friendly** - Reviews happen on documents, not code
3. **Junior-Dev-Friendly** - Clear tasks, no architectural decisions
4. **Fast Delivery** - Parallel research, mechanical implementation
5. **Quality Built-In** - Plans validated before coding starts

## Implementation Steps

1. Create the three command files
2. Set up template structure
3. Test with small client project
4. Document success patterns
5. Scale to larger projects

## Success Metrics

- Research phase: <2 days
- Plan phase: <1 day
- Implementation: 5-10 tasks/day/developer
- Client approval: First try (plan reviewed beforehand)
- Total time to MVP: <3 weeks

This isn't theory - this is how Dex ships 35k lines without reading code. The difference is you're adapting it for client work with junior developers.