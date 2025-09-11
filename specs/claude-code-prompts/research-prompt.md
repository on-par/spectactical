# Claude Code Research Prompt Template

## RESEARCH PHASE: {{topic}}

I need you to research "{{topic}}" following the RPI methodology.

**IMPORTANT**: Focus only on the What and Why at a high level. Don't get into implementation details.

Your research should make you an expert on this topic and capture:

### 1. Problem Statement
- **What are we solving?** - The core problem or feature need
- **Why does this matter?** - Business impact and importance  
- **What's the current pain?** - Existing problems and limitations

### 2. System Understanding
- **How does the current system work?** - Architecture overview
- **Key files**: `path/file.ext:line-range` - Specific file locations and purposes
- **Data flow**: Component A → Component B → Component C
- **Critical dependencies**: External services, databases, APIs

### 3. Problem Location
- **Where is the issue/feature located?** - Primary files and components
- **What are the integration points?** - How this connects to other parts
- **What are the related components?** - Upstream/downstream effects

### 4. Constraints & Requirements
- **Technical constraints**: Performance, compatibility, security, scale
- **Business constraints**: Timeline, resources, compliance
- **Team constraints**: Skills, availability, process limitations

### 5. Success Criteria
- **Functional requirements**: What functionality must be delivered
- **Performance requirements**: Speed, throughput, resource usage targets
- **Quality requirements**: Testing, security, maintainability standards

### 6. Open Questions
- **Technical questions**: Architecture, approach, integration uncertainties
- **Business questions**: Requirements, priorities, user experience decisions
- **Process questions**: Deployment, testing, review procedures

---

## Use this exact template structure:

```markdown
# Research: {{topic}}
*Generated: {{timestamp}} | Phase: Research | Session: {{sessionId}}*

## 🎯 Problem Statement
**What are we solving?**

### Core Problem
[Describe the fundamental issue or feature need]

### Business Impact  
[Why this matters to the business/users]

### Current Pain Points
[What's broken or missing right now]

---

## 🏗️ System Understanding  
**How does the current system work?**

### Architecture Overview
[High-level system design]

### Key Components
- **Component 1**: `path/to/file.ext:line-range` - [purpose]
- **Component 2**: `path/to/file.ext:line-range` - [purpose]
- **Component 3**: `path/to/file.ext:line-range` - [purpose]

### Data Flow
```
[Request/Input] → [Component A] → [Component B] → [Component C] → [Output]
```

### Critical Interfaces
- **API/Interface 1**: [description, location]
- **API/Interface 2**: [description, location]

### Dependencies
- **External Services**: [list services this interacts with]
- **Databases**: [data stores involved]
- **Third-party APIs**: [external dependencies]

---

## 📍 Problem Location
**Where is the issue/feature located?**

### Primary Files
- `src/component/file.js:89-104` - [what happens here]
- `lib/service/handler.py:156-180` - [what happens here]

### Related Components  
- **Upstream**: [what feeds into this]
- **Downstream**: [what this affects]
- **Siblings**: [parallel components that might be affected]

### Integration Points
- **Database interactions**: [which tables/collections]
- **API endpoints**: [which routes affected]
- **External services**: [which integrations involved]

---

## ⚖️ Constraints & Requirements

### Technical Constraints
- **Performance**: [response time, throughput requirements]
- **Compatibility**: [backward compatibility needs]
- **Security**: [security requirements, compliance]
- **Scale**: [expected load, user count]

### Business Constraints
- **Timeline**: [delivery expectations]
- **Resources**: [team capacity, budget]
- **Compliance**: [regulatory requirements]

### Team Constraints  
- **Skills**: [team expertise areas]
- **Availability**: [capacity limitations]
- **Process**: [deployment, testing constraints]

---

## ✅ Success Criteria
**How do we know we're done?**

### Functional Requirements
- [ ] [Specific functional outcome 1]
- [ ] [Specific functional outcome 2]
- [ ] [Specific functional outcome 3]

### Performance Requirements
- [ ] [Performance metric 1: < X ms response time]
- [ ] [Performance metric 2: > Y requests/second]
- [ ] [Performance metric 3: < Z% error rate]

### Quality Requirements
- [ ] [Code coverage > X%]
- [ ] [No security vulnerabilities]
- [ ] [Documentation updated]

### Business Requirements
- [ ] [User satisfaction metric]
- [ ] [Business metric improvement]
- [ ] [Compliance requirement met]

---

## ❓ Open Questions
**What needs clarification before planning?**

### Technical Questions
- [ ] [Question about technical approach/architecture]
- [ ] [Uncertainty about performance implications]
- [ ] [Need clarity on integration approach]

### Business Questions
- [ ] [Question about requirements priority]
- [ ] [Need input on user experience approach]
- [ ] [Clarification needed on success metrics]

### Process Questions
- [ ] [Question about deployment strategy]
- [ ] [Testing approach needs definition]
- [ ] [Review process clarification needed]

---

## 📊 Research Quality Checklist
**Validation criteria for this research:**

- [ ] Problem clearly defined with business context
- [ ] System architecture understood with file:line specificity
- [ ] All dependencies and constraints identified
- [ ] Success criteria are measurable and testable
- [ ] All questions answered or marked for follow-up
- [ ] No implementation details included (stay at "what" level)

---
**Research Status**: Draft | Under Review | Validated | Complete
**Context Utilization**: [X]% 
**Next Phase**: Planning
**Validation Notes**: [Add reviewer feedback here]
```

---

## Research Guidelines:

### DO:
- ✅ Use grep/search tools to understand the codebase
- ✅ Read existing files to understand current architecture
- ✅ Include specific file paths with line numbers (file.ext:123-145)
- ✅ Focus on business context and user impact
- ✅ Ask clarifying questions about unclear requirements
- ✅ Identify all constraints and dependencies
- ✅ Define measurable success criteria

### DON'T:
- ❌ Write any implementation code
- ❌ Design specific technical solutions
- ❌ Get into implementation details
- ❌ Make technology choices or architectural decisions
- ❌ Write pseudo-code or algorithms

### Context Management:
- Monitor your context utilization - aim to stay under 40%
- Use subagents for complex searches if available
- Focus on understanding, not problem-solving
- Keep responses structured and scannable

**Remember**: Research phase is about understanding the problem space completely. Save the "how" for the planning phase. Focus on the "what" and "why" now.

---

**Next Steps**: After completing research, save to `01-research.md` and run `/rpi research validate` to check completeness before moving to planning phase.