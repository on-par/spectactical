# Debug Command

A diagnostic tool for investigating issues during manual testing or implementation.

## Purpose

The debug command provides a systematic approach to troubleshooting by examining:

1. **Logs** (located in `~/.humanlayer/logs/`)
2. **Database state** (SQLite database)
3. **Git history and current state**

## Invocation Modes

### With Plan/Ticket File
```bash
/debug path/to/plan_or_ticket.md
```

### General Debug (No Parameters)
```bash
/debug
```

## Investigation Process

### Step 1: Understand the Problem
- Read the plan/ticket file (if provided)
- Understand what should be working
- Identify the specific symptoms or failures

### Step 2: Investigate the Issue
Launch parallel investigation tasks:
- **Log Analysis**: Examine recent logs for errors, warnings, and relevant activity
- **Database Inspection**: Check database state and recent changes
- **System State**: Review current git state, running processes, configuration

### Step 3: Present Findings
Generate a comprehensive debug report including:
- **Problem Summary**: What the issue appears to be
- **Evidence**: Relevant log entries, database records, system state
- **Timeline**: When the issue likely started occurring
- **Root Cause Analysis**: Likely explanation for the issue
- **Recommended Actions**: Specific steps to resolve the problem

## Key Features

- **Parallel Task Investigation**: Uses multiple specialized agents simultaneously
- **Detailed Problem Analysis**: Thorough examination of logs, database, and system state  
- **Structured Debug Report**: Organized findings with clear actionable recommendations
- **No File Editing**: Diagnostic only - does not modify any files

## Investigation Areas

### Logs Analysis
- Recent error messages and stack traces
- Warning patterns and frequency
- Timeline of events leading to issue
- Performance indicators and resource usage

### Database State
- Recent data changes
- Inconsistencies or corruption indicators
- Connection issues or query failures
- Migration status and schema integrity

### Git and System State
- Recent commits and their potential impact
- Current branch status and merge conflicts
- Configuration changes
- Environment variables and dependencies

## Output Format

The debug command produces a structured report with:

1. **Executive Summary**: Brief overview of findings
2. **Problem Details**: Specific symptoms and evidence
3. **Timeline Analysis**: When issues started and progression
4. **Root Cause**: Most likely explanation for the problem
5. **Resolution Steps**: Prioritized actions to fix the issue
6. **Prevention**: Suggestions to avoid similar issues

## Usage Guidelines

- Use when manual testing reveals unexpected behavior
- Run after implementation changes that cause issues
- Invoke during troubleshooting sessions
- Call before escalating issues to identify clear problem statements

The debug command helps users quickly diagnose and understand issues without needing to manually sift through logs and database records.