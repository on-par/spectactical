# Validate Plan

This command provides a comprehensive process for verifying the correct implementation of a project plan, ensuring all requirements have been met and quality standards maintained.

## Process Overview

1. **Context Discovery**: Locate and analyze implementation plan
2. **Evidence Gathering**: Collect data about current implementation status
3. **Systematic Validation**: Check completion against plan criteria
4. **Generate Validation Report**: Document findings and recommendations

## Key Principles

### Thorough but Practical
- Run all automated checks and verifications
- Document both successes and issues clearly
- Think critically about implementation quality
- Consider long-term maintenance implications

### Systematic Approach
- Follow plan structure methodically
- Verify both automated and manual criteria
- Check edge cases and error handling
- Assess integration with existing systems

## Validation Methodology

### Stage 1: Context Discovery
- Determine if existing context is available or start fresh
- Locate implementation plan document
- Gather evidence via git commands and repository checks
- Understand current system state

### Stage 2: Plan Analysis
- Read implementation plan completely
- Identify all phases and success criteria
- Note automated verification requirements
- Document manual verification steps

### Stage 3: Systematic Validation
- Check completion status of each plan phase
- Run all automated verifications (tests, builds, linting)
- Assess manual criteria and user experience requirements
- Analyze potential edge cases and error scenarios
- Review code quality and maintainability

### Stage 4: Report Generation
- Provide detailed status of implementation
- Document automated test results and outcomes
- Highlight code review findings and observations
- List manual testing requirements and results
- Offer specific recommendations for improvement

## Validation Report Structure

```markdown
# Validation Report: [Plan Title]

## Executive Summary
- Overall implementation status
- Key successes and achievements
- Critical issues requiring attention

## Plan Completion Status
### Phase 1: [Phase Name] - [STATUS]
- ✅ Completed items
- ❌ Failed or incomplete items
- ⚠️ Items requiring attention

## Automated Verification Results
### Test Suite Status
- Unit tests: [PASS/FAIL] - [details]
- Integration tests: [PASS/FAIL] - [details]
- End-to-end tests: [PASS/FAIL] - [details]

### Code Quality Checks
- Linting: [PASS/FAIL] - [details]
- Type checking: [PASS/FAIL] - [details]
- Security scans: [PASS/FAIL] - [details]

## Manual Verification Assessment
### Functional Requirements
- Feature functionality: [assessment]
- User experience: [assessment]
- Performance characteristics: [assessment]

### Integration Points
- API compatibility: [assessment]
- Database integration: [assessment]
- Third-party services: [assessment]

## Code Review Findings
- Architecture compliance
- Code quality observations
- Potential technical debt
- Security considerations

## Recommendations
### Immediate Actions Required
- Critical issues to address
- Blocking problems for deployment

### Future Improvements
- Technical debt to address
- Performance optimizations
- Maintainability enhancements

## Conclusion
Overall assessment and readiness for next steps
```

## Quality Standards

### Automated Verification
- All tests must pass consistently
- Code quality tools should report no critical issues
- Build and deployment processes must succeed
- Performance benchmarks should meet requirements

### Manual Verification
- Features should work as specified in requirements
- User experience should meet design expectations
- Edge cases should be handled appropriately
- Error conditions should be managed gracefully

### Code Quality Assessment
- Code should follow project conventions
- Architecture should align with design decisions
- Documentation should be complete and accurate
- Security best practices should be implemented

## Workflow Integration

This command typically follows:
- **Implementation completion** (`/implement_plan`)
- **Code commits** (`/commit`)
- **Pull request creation** (`/describe_pr`)

And leads to:
- **Deployment preparation**
- **Release planning**
- **Documentation updates**

## Important Guidelines

- **Be thorough** in checking all plan requirements
- **Document objectively** what you find
- **Provide actionable recommendations** for improvement
- **Consider long-term implications** of implementation choices
- **Verify both technical and functional requirements**

The goal is to ensure implementation completeness, quality, and readiness for production deployment while maintaining high standards for code quality and system reliability.