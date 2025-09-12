# The RPI Loop: AI-Assisted Engineering Practice

The **RPI Loop** (Research → Plan → Implement) is a repeatable, scalable, and tool-agnostic methodology for integrating AI into software engineering workflows. It is designed to help engineers (individuals first, teams and orgs later) reduce cycle time, minimize rework, and adopt AI as a **co-developer** instead of a code-autocompleter.

---

## Why the RPI Loop?

Software engineering today increasingly involves AI. But without structure, AI outputs can be noisy, oversized, or brittle. The RPI Loop introduces **lightweight rigor** around AI-assisted work:

- **Faster throughput**: Optimize **PR cycle time**.  
- **Higher quality**: Improve % of AI-generated code that merges **without rework**.  
- **Small, testable changes**: Enforce **INVEST** criteria for manageable units of work.  
- **Tool-agnostic practice**: Works with Copilot, Claude Code, Cursor, Gemini, Windsor, etc.  

---

## Principles

1. **Semi-open loop by default**  
   AI runs each phase, but humans verify outputs at key gates.  
   (Future closed-loop automation possible once trust builds.)

2. **Artifacts as source of truth**  
   Each phase produces a **Markdown file with YAML frontmatter**, committed under `thoughts/<ticket>/`.

3. **Lightweight rigor**  
   Each phase loops until it meets **exit criteria** (validation + human approval).  

4. **Small scope enforced**  
   Work must pass INVEST (Independent, Negotiable, Valuable, Estimable, Small, Testable). Oversized items are rejected or broken down.

5. **Structured validation**  
   Research outputs scored against the **FAR filter** (Factual, Actionable, Reliable, Relevant). Minimum average: **≥4.0/5**.

6. **Context economy**  
   At most **40% of AI context window** may be consumed per phase. Summaries and file references replace long pastes.

---

## The Phases

### 1. Research
**Goal:** Understand the problem, locate impacted code, and gather references.

- **Inputs:** Freeform requirement (ticket, issue, user story).  
- **Outputs:** `research.md` with:
  - Problem statement
  - Impacted files/classes/functions
  - Example code patterns in repo
  - Risks/constraints
  - FAR filter scores (0–5 each, average ≥4.0)
- **Validation:** FAR filter applied; human approval required.  
- **Timebox:** ≤10 minutes, ≤3 retries, then escalate.  

---

### 2. Plan
**Goal:** Translate research into a **deterministic, stage-based plan**.

- **Inputs:** Approved `research.md`.  
- **Outputs:** `plan.md` with:
  - Stages (e.g., Scaffold, Tests, Implement, Wire-up, Docs)
  - Ordered tasks within each stage
  - CLI commands written explicitly
  - File creation/edit tasks with short, specific step descriptions
  - Parallelizable tasks flagged `(P)`
- **Validation:** Human verifies plan is executable and complete.  
- **Timebox:** ≤10 minutes, ≤3 retries, then escalate.  

---

### 3. Implement
**Goal:** Execute the plan, log progress, and enforce quality guardrails.

- **Inputs:** Approved `plan.md`.  
- **Outputs:** `implement.md` with:
  - Task checklist (mirrors `plan.md`)
  - Execution log (tasks marked complete)
  - CI/validation results
- **Validation Gates:**  
  - ✅ Unit tests (TDD required)  
  - ✅ Linter  
  - ✅ Typecheck  
  - ✅ Build  
  - ✅ Docs/changelog updated if relevant  
  - ☐ Integration tests (optional)  
  - ☐ Security scan (tooling)  
  - ☐ Migration review (optional)  
  - ☐ Perf budget check (optional)  
- **Failure handling:**  
  - If trivial fix → AI retries once.  
  - If non-trivial → pause, escalate to human.  
- **Timebox:** ≤30 minutes, ≤3 retries.  

---

## Loop Control

- **Backward jumps:** If validation fails, AI prompts human whether to retry the phase or jump back.  
- **Retries:** Max 3 per phase before escalation.  
- **Stop conditions:** Timebox exceeded, repeated low FAR score, or human rejects.  

---

## Artifacts & Repo Structure

Each run lives in a `thoughts/` folder, scoped by ticket or topic.

repo-root/
thoughts/
TICKET-123/
research.md
plan.md
implement.md

All files are **Markdown with YAML frontmatter** for easy human reading and optional machine parsing.

---

## Metrics

- **PR Cycle Time**  
  Start: Research kickoff  
  End: PR merged  
  (Can be measured via timestamps in artifacts or CI/CD system.)

- **% AI-generated code without rework**  
  Reported by AI tools (Copilot, Claude Code, Cursor, etc.).  
  The methodology consumes these metrics rather than re-implementing tracking.

---

## Example Workflows

### Minimal Workflow
1. `/research` — Generate `research.md`.  
2. Human approves.  
3. `/plan` — Generate `plan.md`.  
4. Human approves.  
5. `/implement` — Execute and log tasks in `implement.md`.  
6. Validate tests/lint/build/docs.  
7. Open PR.

### Backtrack Workflow
- If Plan fails validation → user chooses to retry Plan or jump back to Research.  
- If Implement fails CI → AI retries simple fixes; complex failures escalated.

---

## Adoption Path

1. **Individual practice**  
   Engineers use the loop to structure their own AI-assisted work.  

2. **Team-level standard**  
   Shared templates, consistent artifact naming, reusable prompts.  

3. **Org-level framework**  
   Layer on governance, CI checks, compliance, and integration with metrics dashboards.  

---

## Mermaid Diagrams

### High-Level RPI Loop
```mermaid
flowchart TD
    A[Requirement] --> R[Research]
    R --> RV[Validate Research (FAR ≥4.0)]
    RV -->|Pass| P[Plan]
    RV -->|Fail| R
    P --> PV[Validate Plan]
    PV -->|Pass| I[Implement]
    PV -->|Fail| P
    I --> IV[Validate Implementation]
    IV -->|Pass| M[PR Ready]
    IV -->|Fail| I
    M --> Done[Done]

Artifacts Flow

flowchart LR
    R[Research] -->|research.md| P[Plan]
    P -->|plan.md| I[Implement]
    I -->|implement.md| PR[Pull Request]


⸻

Summary

The RPI Loop is a lightweight but rigorous way to channel AI assistance in software engineering.
	•	It creates artifacts at each step for repeatability and auditability.
	•	It balances automation with human judgment.
	•	It emphasizes fast feedback, small scope, and quality guardrails.
	•	It is tool-agnostic, polyglot, and designed to scale from individuals to organizations.

By following this loop, engineers can safely adopt AI in their workflows while improving speed, quality, and confidence in their codebase.
