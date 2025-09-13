# RPI-Kit with Automatic Context Cycling

## The Problem
- Plans with 100+ tasks would overwhelm any AI context
- Manual context switching is tedious and error-prone
- Need systematic way to maintain focus across long implementations

## Solution: Smart Task Cycling

### Enhanced File Structure
```
.rpi/
├── current/
│   ├── plan.md                 # Master plan
│   ├── progress.md            # Overall progress
│   ├── context/               # Context cycling
│   │   ├── task-001.md       # Individual task contexts
│   │   ├── task-002.md
│   │   └── handoffs/         # Context handoff summaries
│   └── automation/
│       ├── auto-cycle.sh     # Automatic cycling script
│       └── task-queue.txt    # Remaining tasks
```

### Automatic Cycling Script (`rpi-auto.sh`)

```bash
#!/bin/bash
# RPI Automatic Task Cycling

RPI_DIR=".rpi"
CURRENT_TASK_FILE="$RPI_DIR/automation/current-task.txt"
TASK_QUEUE="$RPI_DIR/automation/task-queue.txt"
HANDOFF_DIR="$RPI_DIR/current/context/handoffs"

# Extract all incomplete tasks from plan
extract_tasks() {
    grep "- \[ \]" "$RPI_DIR/current/plan.md" | nl > "$TASK_QUEUE"
}

# Get focused context for current task
get_task_context() {
    local task_num=$1
    cat << EOF
# Task $task_num Implementation

## Your Focus
$(sed -n "${task_num}p" "$TASK_QUEUE")

## Relevant Plan Context
$(head -20 "$RPI_DIR/current/plan.md")  # Just the strategy/overview

## Previous Task Handoff
$(cat "$HANDOFF_DIR/task-$(printf '%03d' $((task_num-1))).md" 2>/dev/null || echo "No previous task")

## Instructions
1. Implement ONLY this specific task
2. When complete, provide handoff summary for next task
3. Keep implementation focused and atomic
4. Test the specific functionality added

IMPORTANT: Focus only on this task. Don't try to solve everything at once.
EOF
}

# Cycle through tasks automatically
auto_cycle() {
    extract_tasks
    local total_tasks=$(wc -l < "$TASK_QUEUE")
    
    for task_num in $(seq 1 $total_tasks); do
        echo "🔄 Starting Task $task_num of $total_tasks"
        
        # Create focused context
        get_task_context $task_num > "$RPI_DIR/current/context/task-$(printf '%03d' $task_num).md"
        
        # Show user what to copy to Claude
        echo "📋 Copy this to Claude:"
        echo "=================="
        cat "$RPI_DIR/current/context/task-$(printf '%03d' $task_num).md"
        echo "=================="
        
        # Wait for user to complete task
        read -p "Press Enter when task is complete..."
        
        # Prompt for handoff
        echo "✏️  Create handoff summary in: $HANDOFF_DIR/task-$(printf '%03d' $task_num).md"
        read -p "Press Enter when handoff is ready..."
        
        # Update progress
        update_progress $task_num
    done
    
    echo "🎉 All tasks complete!"
}

# Update overall progress
update_progress() {
    local completed_task=$1
    # Mark task as complete in plan.md
    # Update progress.md with completion
}
```

### Smart Context Prompts

#### Task Completion Template
```markdown
## Task Implementation Complete

**Task**: [CURRENT_TASK]

### What I Did
- Brief summary of implementation
- Key code/files changed
- Tests added/run

### Handoff for Next Task
**Context the next person needs**:
- State of the system now
- Any important decisions made
- Potential gotchas or considerations
- What files/components were modified

**Next task dependencies**:
- What this task provides for next task
- Any setup or prerequisites for next task

### Issues/Blockers
- Any problems encountered
- Workarounds used
- Things to revisit later

---
*Ready for next task context cycle*
```

## Enhanced RPI-Kit Features

### 1. **Task Extraction** (`rpi tasks`)
```bash
#!/bin/bash
# Extract tasks from plan into numbered queue
grep "- \[ \]" .rpi/current/plan.md | nl -nln > .rpi/automation/task-queue.txt
echo "Found $(wc -l < .rpi/automation/task-queue.txt) tasks"
```

### 2. **Context Cycling** (`rpi next`)
```bash
#!/bin/bash
# Generate focused context for next task
TASK_NUM=$(cat .rpi/automation/current-task.txt || echo "1")
# Generate focused prompt for just this task
# Include minimal necessary context
# Show clear copy-paste instructions
```

### 3. **Progress Tracking** (`rpi status`)
```bash
#!/bin/bash
# Show overall progress
TOTAL=$(wc -l < .rpi/automation/task-queue.txt)
CURRENT=$(cat .rpi/automation/current-task.txt || echo "1")
echo "Progress: $CURRENT of $TOTAL tasks ($((CURRENT*100/TOTAL))%)"
```

## Claude CLI Integration

If Claude CLI is available, we could fully automate:

```bash
#!/bin/bash
# Fully automated RPI cycle
rpi_auto_implement() {
    for task_num in $(seq 1 $total_tasks); do
        echo "🤖 Auto-implementing task $task_num"
        
        # Generate focused context
        context=$(get_task_context $task_num)
        
        # Run with Claude CLI
        claude -p "$context" > "output-$task_num.md"
        
        # Parse output for handoff info
        extract_handoff "output-$task_num.md" > "handoff-$task_num.md"
        
        # Continue to next task
    done
}
```

## Benefits of This Approach

### Context Management
- ✅ Each task gets fresh, focused context
- ✅ Handoffs preserve necessary information
- ✅ No context pollution between tasks
- ✅ Can handle 100+ task plans systematically

### User Experience  
- ✅ Clear guidance on what to copy/paste
- ✅ Progress tracking across long implementations
- ✅ Resumable if interrupted
- ✅ Scales from simple to complex projects

### Quality Assurance
- ✅ Each task is atomic and focused
- ✅ Handoffs ensure continuity
- ✅ Testing happens per task
- ✅ Easy to debug/fix specific tasks

## Implementation Plan

1. **Phase 1**: Add basic task extraction to current RPI-Kit
2. **Phase 2**: Add context cycling helpers 
3. **Phase 3**: Add full automation (if Claude CLI available)
4. **Phase 4**: Add progress tracking and resumption

This would make RPI truly scalable for large, complex projects while maintaining the simplicity of the file-based approach.