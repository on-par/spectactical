# Generate PR Description

This command generates comprehensive pull request descriptions using GitHub CLI and following a structured workflow.

## Process Overview

The command follows a 9-step process for creating detailed PR descriptions:

1. **Read PR Description Template**
2. **Identify the PR** 
3. **Check for Existing Descriptions**
4. **Gather PR Information**
5. **Analyze Code Changes**
6. **Handle Verification Requirements**
7. **Generate the Description**
8. **Save and Sync the Description**
9. **Update the PR**

## Key Features

- **Thorough Analysis**: Examines all code changes and their context
- **Structured Format**: Uses consistent template for all PR descriptions
- **Verification Focus**: Includes detailed testing and verification requirements
- **Context Preservation**: Maintains links to related tickets, plans, and discussions

## Description Generation Guidelines

### Content Focus
- **Why and What**: Focus on the reasoning behind changes, not just what changed
- **Concise but Thorough**: Detailed enough for reviewers to understand context
- **Verification-Centric**: Clear instructions for testing and validating changes

### Structure Requirements
- Use established PR description template
- Include verification steps (both automated and manual)
- Link to relevant tickets, plans, or documentation
- Highlight any breaking changes or migration requirements

### Quality Standards
- Descriptions should enable efficient code review
- Include enough context for reviewers to understand decisions
- Provide clear acceptance criteria for the changes
- Reference related work and dependencies

## Workflow Integration

This command is typically used:

1. **After Implementation**: When code changes are complete and tested
2. **Before Review**: To prepare comprehensive context for reviewers  
3. **As Part of CI/CD**: Integrated into automated workflows
4. **For Documentation**: Creating historical record of changes

## Important Notes

- Maintains thorough yet concise descriptions
- Focuses on the "why" and "what" of changes
- Follows established team templates and conventions
- Ensures all verification requirements are clearly documented

The goal is to create PR descriptions that enable efficient, thorough code review while maintaining high standards for documentation and context preservation.