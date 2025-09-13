# Research Phase Command v2

This command conducts scoped research on a given topic, validates output using AI agents, and prepares for the planning phase with proper scope control and conflict resolution.

## Usage
```bash
claude -p "/research <topic to research>"
```

## Process Overview

1. **Gather Requirements**: Ask clarifying questions (one at a time) until you understand the research task completely
2. **Scope Validation**: Estimate complexity and warn about oversized research  
3. **Conduct Research**: Use parallel agents to investigate thoroughly
4. **Agent Coordination**: Resolve conflicts and synthesize findings
5. **Create Research Document**: Write comprehensive research output
6. **AI Validation Loop**: Spawn validation agent to score research (up to 3 iterations)
7. **Human Handoff**: Provide explicit next steps

## Phase 1: Requirements Gathering

**Ask clarifying questions ONE AT A TIME** until you have complete understanding:

- What specific problem or feature are we researching?
- What's the current state of the system?  
- What are the success criteria?
- Are there specific constraints or requirements?
- What level of detail is needed?
- What files/components do you think are involved?

**Do not proceed until you have enough context to conduct focused research.**

## Phase 2: Scope Validation & Planning

### Scope Assessment
Before beginning research, estimate the scope:

```markdown
**Research Scope Assessment:**
- Estimated components involved: [X]
- Estimated files to analyze: [X] 
- Dependencies to investigate: [X]
- Integration points: [X]

**Scope Classification:**
- [ ] FOCUSED: Single component/feature (✅ Proceed)
- [ ] MODERATE: 2-3 related components (⚠️ Proceed with caution)  
- [ ] BROAD: Multiple systems/domains (🛑 Break down required)
```

### Scope Control Rules
- **FOCUSED** (≤10 files, 1-2 components): Proceed normally
- **MODERATE** (11-25 files, 3-5 components): Issue warning, confirm with user
- **BROAD** (>25 files, >5 components): **STOP** - require breakdown into smaller research tasks

If scope is BROAD, output:
```
🛑 SCOPE TOO LARGE

This research appears to span multiple domains/systems. For accurate, actionable results, please break this into smaller focused research tasks.

Suggested breakdown:
1. [Specific area 1]
2. [Specific area 2]  
3. [Specific area 3]

Choose one area to research first, then iterate.
```

## Phase 3: Research Execution

### Stage 1: Investigation Planning
Based on validated scope, identify focused research areas:
- Core component architecture  
- Key integration points
- Critical dependencies
- Relevant patterns/examples

### Stage 2: Parallel Investigation  
Spawn **2-4 specialized Task agents** simultaneously:

**Required agent assignments:**
- **Architecture Agent** (`codebase-analyzer`): "Analyze architecture and key components for [SPECIFIC_COMPONENT]"
- **Pattern Agent** (`codebase-pattern-finder`): "Find existing implementation patterns for [SPECIFIC_FUNCTIONALITY]"

**Optional based on scope:**
- **Integration Agent** (`codebase-locator`): "Locate integration points and dependencies for [COMPONENT]"
- **Example Agent** (`codebase-pattern-finder`): "Find similar implementations to model after for [FEATURE]"

### Stage 3: Agent Coordination & Conflict Resolution
After parallel investigation completes:

1. **Compare Findings**: Review all agent outputs for consistency
2. **Identify Conflicts**: Note contradictory information or gaps
3. **Resolve Conflicts**: Use additional targeted investigation if needed
4. **Flag Uncertainties**: Mark areas requiring human clarification

### Stage 4: Synthesis
Combine validated findings:
- Document architectural insights with specific file references
- Highlight implementation patterns and examples
- Note critical dependencies and constraints
- Identify recommended approaches

## Phase 4: Research Documentation

Create `thoughts/research-{TIMESTAMP}.md` (use timestamp if no issue ID):

```markdown
---
title: "Research: [Topic Title]"
date: {TODAY}
issue: {ISSUE_ID or "ad-hoc"}
researchers: [list of agent types used]
scope: [FOCUSED/MODERATE/BROAD]
estimated_files: {X}
estimated_components: {X}  
---

# Research Summary
Brief overview of key findings and recommended implementation approach.

## Scope & Focus
- **Research question**: [Original question]
- **Scope classification**: [FOCUSED/MODERATE] 
- **Components analyzed**: [X files across Y components]
- **Validation score**: [Score from final validation]

## Problem Statement  
- What specific problem are we solving?
- Current state vs desired state
- Why this approach was chosen for research

## Key Findings & Recommendations

### Recommended Implementation Approach
- **Primary pattern to follow**: `file:line` - [Brief description]
- **Key components to modify/extend**: `file:line`
- **Integration points**: `file:line`

### Architecture Insights
- **Design patterns identified**: [Pattern name] in `file:line`
- **Critical dependencies**: [Library/component] used in `file:line`  
- **Data flow**: [Description] via `file:line`

## Component Analysis

### [Primary Component] (`file:line`)
- **Purpose**: [Brief description]
- **Key functionality**: [What it does] 
- **Integration points**: [How others connect to it]
- **Modification approach**: [How to extend/modify]

### [Supporting Components] (`file:line`)  
- **Relationship to primary**: [How they connect]
- **Required changes**: [What needs updating]
- **Dependencies**: [What they depend on]

## Implementation Examples

### Similar Patterns Found (`file:line`)
```[language]
[Code example showing the pattern to follow]
```
**Why this pattern**: [Explanation of why this is the recommended approach]

### Integration Examples (`file:line`)
```[language]  
[Code example showing how components integrate]
```
**Application to our case**: [How this applies to the research question]

## Technical Requirements

### Dependencies
- **Required packages/libraries**: [List with versions if found]
- **Internal dependencies**: `file:line`
- **Configuration needs**: `file:line`

### Constraints & Considerations  
- **Performance implications**: [Based on existing patterns]
- **Security considerations**: [Based on codebase analysis] 
- **Testing approach**: [Based on existing test patterns]

## Risks & Unknowns

### Identified Risks
- **Technical risks**: [Based on code analysis]
- **Integration risks**: [Based on dependency analysis]
- **Complexity risks**: [Based on pattern analysis]

### Open Questions
- [ ] [Specific technical questions requiring clarification]
- [ ] [Architecture decisions needing stakeholder input]
- [ ] [Implementation details requiring deeper investigation]

## Next Steps
1. **Review findings**: Validate recommendations align with requirements
2. **Run planning**: `claude -p "/plan {ISSUE_ID or research filename}"`
3. **Address open questions**: [If any critical unknowns remain]
```

## Phase 5: AI Validation Loop - Enhanced FARR Filter

Generate unique issue ID if none provided: `research-{YYYYMMDD-HHMMSS}`

Spawn a validation Task agent (`thoughts-analyzer`) with this prompt:

```
Validate the research document at thoughts/research-{ID}.md using enhanced FARR criteria:

**FACTUAL (0-5)**: 
- All file references include specific paths and line numbers
- Code examples are accurate and verifiable  
- Dependencies and versions are correct
- Architectural claims match codebase reality

**ACTIONABLE (0-5)**:
- Clear implementation approach identified
- Specific components to modify listed with locations
- Integration points documented with examples
- Next steps are concrete and achievable

**RELIABLE (0-5)**:
- No contradictions between agent findings
- Information is internally consistent  
- Claims are supported by code evidence
- Architectural understanding is sound

**RELEVANT (0-5)**:
- Directly addresses the original research question
- Stays within defined scope boundaries
- Focuses on implementation-ready insights
- Provides practical guidance for planning

**Scoring Rubric:**
- 5: Exceptional - exceeds all criteria
- 4: Good - meets all criteria solidly  
- 3: Adequate - meets most criteria
- 2: Poor - missing key criteria
- 1: Very poor - major deficiencies
- 0: Unacceptable - fails criteria

**Requirements Check:**
- [ ] Specific file references (`file:line` format throughout)
- [ ] Scope classification and boundaries clearly defined
- [ ] Implementation patterns identified with examples
- [ ] Integration points documented with code references
- [ ] Recommended approach clearly articulated
- [ ] Open questions explicitly listed
- [ ] YAML frontmatter with complete metadata

**Output Format:**
SCORES: F={X}/5, A={X}/5, R={X}/5, R={X}/5 | Average: {X.X}/5
STATUS: [PASS ≥4.0 / FAIL <4.0]
CRITICAL_ISSUES: [List any blocking problems]  
IMPROVEMENTS_NEEDED: [Specific fixes required]
CONFIDENCE_LEVEL: [HIGH/MEDIUM/LOW based on evidence quality]

Write validation results to thoughts/research-{ID}-validation.md
```

**Enhanced Validation Loop:**
- **Score ≥4.0 + HIGH confidence**: Proceed to handoff
- **Score ≥4.0 + MEDIUM confidence**: One refinement cycle, then proceed  
- **Score <4.0**: Refine research based on specific feedback
- **Maximum 3 research → validation cycles**
- **After 3 attempts**: Document limitations and proceed with warning

## Phase 6: Human Handoff

When research passes validation:

```
✅ RESEARCH PHASE COMPLETE

Research document: thoughts/research-{ID}.md
Validation score: {SCORE}/5 (Confidence: {LEVEL})
Scope: {FOCUSED/MODERATE} - {X} files across {Y} components

Key Recommendations:
• Primary approach: [Brief summary]
• Main components: [File references]  
• Integration pattern: [Pattern name]

Next step: Review the research document and run:
claude -p "/plan {ID}"

The planning phase will use this research to create a detailed implementation plan.
```

If research completed with limitations:
```
⚠️ RESEARCH PHASE COMPLETE (with limitations)

Research document: thoughts/research-{ID}.md  
Validation score: {SCORE}/5 (after 3 attempts)
Known limitations: [List specific gaps]

Proceed with caution - consider additional focused research on unclear areas.

Next step: claude -p "/plan {ID}"
```

## Quality Standards & Guidelines

### Scope Management
- **Always validate scope** before beginning investigation
- **Break down oversized research** into focused chunks
- **Warn users** about moderate scope and confirm before proceeding
- **Refuse broad scope** research and require breakdown

### Research Accuracy  
- **Read files fully** before drawing conclusions - no assumptions
- **Include specific references** - always use `file:line` format
- **Verify agent findings** through coordination phase
- **Document conflicts** and resolution approaches

### Agent Coordination
- **Use specialized agents** for different investigation types
- **Compare findings systematically** across all agents
- **Resolve conflicts** through additional targeted investigation
- **Flag unresolvable conflicts** for human attention

### Documentation Quality
- **Focus on implementation guidance** - what to build and how
- **Include concrete examples** from existing codebase  
- **Document integration patterns** with specific file references
- **List actionable next steps** for planning phase

## Error Handling

### Agent Failures
- If agents fail to find files: Document the gap and continue with available information
- If code references are invalid: Re-run targeted investigation with corrected parameters
- If agents produce contradictory findings: Use additional investigation to resolve

### Context Overrun
- If hitting context limits: Prioritize most critical findings for documentation
- If research scope was underestimated: Stop and recommend breaking down the task
- If validation keeps failing: Document known limitations and proceed after 3 attempts

The goal is to produce focused, accurate, implementation-ready research that provides confidence for the planning phase while maintaining reasonable scope boundaries.