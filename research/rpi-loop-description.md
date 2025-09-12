# RPI Loop: Research → Plan → Implement

A lightweight, repeatable, and polyglot process for AI-assisted engineering.
Designed for individuals first, extensible to teams and orgs later.

⸻

## Core Principles
	•	Loop until valid: each phase iterates until it meets exit criteria.
	•	Human-in-the-loop: checkpoints at phase boundaries for trust and safety.
	•	Semi-open by default: AI pauses at gates; future tooling may enable closed loops.
	•	Tool-agnostic: methodology works across Claude Code, Copilot, Cursor, Gemini, etc.
	•	Artifacts as source of truth: Markdown + YAML frontmatter per phase, committed in repo under thoughts/<ticket>/.
	•	Small, testable changes: enforce INVEST sizing; reject oversized features.
	•	Quality guardrails: TDD, lint, typecheck, docs updates required; other checks optional.
	•	Metrics: PR Cycle Time (measured internally) and %AI-generated code without rework (reported by AI tooling).

⸻

## Phase 1: Research

Goal: understand the problem, locate code impact areas, and extract patterns/examples.

### Activities
	•	Parse freeform requirement (ticket, issue, story).
	•	Explore codebase: find relevant files, functions, patterns.
	•	Suggest scope boundaries and risk areas.
	•	Check INVEST criteria (small, estimable, testable).

### Validation
	•	Apply FAR filter:
	•	Factual: correct in context
	•	Actionable: clear next steps exist
	•	Reliable: claims backed by repo/code refs
	•	Relevant: scoped to this repo/problem
	•	Minimum score: ≥4.0/5 average.
	•	Human gate: confirm research output is accurate and scoped.

Artifact: thoughts/<ticket>/research.md
```
---
phase: research
tools_allowed: [copilot, claude-code]
ticket: <id or name>
validated: false
---
# Problem Statement
...

# Impacted Code Areas
- file1.cs
- file2.ts

# Patterns/Examples
- See `src/api/userController.cs` for reference.

# Risks
- Touches auth module, may be large.
```

⸻

## Phase 2: Plan

Goal: translate research into a deterministic, executable plan.

### Activities
	•	Generate ordered task list.
	•	Separate into stages; allow parallelism inside stages.
	•	Specify CLI commands directly.
	•	For code tasks: short, tightly scoped step descriptions + references to examples.

### Validation
	•	Plan must map research → tasks clearly.
	•	Check tasks are executable by AI/human.
	•	Human gate: approve/reject before implementation.

Artifact: thoughts/<ticket>/plan.md
```
---
phase: plan
stages: 3
validated: false
---
# Stage 1: Scaffold
- [ ] run: `dotnet new class -n UserService -o src/Services`
- [ ] create: `src/Services/UserService.cs`

# Stage 2: Tests
- [ ] create: `tests/UserServiceTests.cs`
- [ ] add: unit test skeleton, see `tests/AuthServiceTests.cs`

# Stage 3: Implement
- [ ] implement methods in UserService
- [ ] update DI registration in `Startup.cs`
```

⸻

## Phase 3: Implement

Goal: execute the plan tasks until completion.

### Activities
	•	Run CLI tasks deterministically.
	•	Generate code files/methods per plan.
	•	Use examples for consistency.
	•	Mark tasks complete in plan.md or implement.md.

### Validation
	•	All unit tests pass (TDD enforced).
	•	Integration tests (optional).
	•	Linter + typecheck must pass.
	•	Build must succeed.
	•	Docs/changelog updated if needed.
	•	On CI failure:
	•	If simple fix (1-line, trivial) → auto-fix loop.
	•	Else stop & ask human.

Artifact: thoughts/<ticket>/implement.md
```
---
phase: implement
validated: false
---
# Implementation Log
- [x] Created `UserService.cs`
- [x] Added tests in `UserServiceTests.cs`
- [ ] Implemented CRUD methods
- [ ] All tests green
```

⸻

## Loop Control
	•	Timeboxes: Research ≤10m, Plan ≤10m, Implement ≤30m.
	•	Retries: ≤3 per phase, then escalate to human.
	•	Backward jumps: prompt human whether to retry current phase or return to previous.
	•	Context cap: each phase should consume ≤40% of model context; maintain context.md file with instructions.

⸻

## Default Quality Guardrails
	•	Required: Unit tests (TDD), Linter, Typecheck, Docs/changelog.
	•	Optional: Integration tests, Security scan (tooling), Migration reviewed, Perf budget.

⸻

## Adoption Path
	1.	Individual practice: personal workflow in any repo.
	2.	Team template: shared thoughts/ structure, consistent gates.
	3.	Org framework: layered policies, tracked against DORA metrics.

⸻

## Mermaid Diagrams

### High-level RPI Loop

```flowchart TD
    A[Start: Requirement] --> R[Research Phase]
    R --> RV[Validate Research (FAR ≥4.0)]
    RV -->|Pass| P[Plan Phase]
    RV -->|Fail| R
    P --> PV[Validate Plan]
    PV -->|Pass| I[Implement Phase]
    PV -->|Fail| P
    I --> IV[Validate Implementation]
    IV -->|Pass| M[PR Ready]
    IV -->|Fail| I
    M --> Done[Done]
```

### Research → Plan → Implement Artifacts

```flowchart LR
    R[Research] -->|research.md| P[Plan]
    P -->|plan.md| I[Implement]
    I -->|implement.md| PR[Pull Request]
```