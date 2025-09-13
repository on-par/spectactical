# 🚀 RPI-Kit

**Transform chaotic AI coding into systematic development with the Research → Plan → Implement methodology.**

Stop "vibe coding" with AI. Start building with confidence.

## ✨ What is RPI-Kit?

RPI-Kit brings structure to AI-assisted development through three simple phases:

1. **Research** - Understand the problem deeply before coding
2. **Plan** - Break work into atomic, manageable tasks  
3. **Implement** - Execute systematically with progress tracking

It's just templates and prompts. No complex tools. No learning curve.

## 🎯 Works With Your AI Tool

- ✅ **Claude Code** (Desktop)
- ✅ **GitHub Copilot** (VS Code)
- ✅ **Google Gemini** (Cloud Console)
- ✅ Any AI coding assistant

## 📦 Installation

One line. No dependencies. Ready in seconds:

```bash
curl -sSL https://raw.githubusercontent.com/yourusername/rpi-kit/main/install.sh | bash
```

Or specify your AI tool:

```bash
# For Claude Code
curl -sSL https://raw.githubusercontent.com/yourusername/rpi-kit/main/install.sh | bash -s -- --ai claude

# For GitHub Copilot  
curl -sSL https://raw.githubusercontent.com/yourusername/rpi-kit/main/install.sh | bash -s -- --ai copilot

# For Google Gemini
curl -sSL https://raw.githubusercontent.com/yourusername/rpi-kit/main/install.sh | bash -s -- --ai gemini
```

## 🎬 How It Works

### 1️⃣ Research Phase
```bash
# Copy .rpi/prompts/[your-ai]/research.md to your AI tool
# AI helps you understand the problem thoroughly
# Save output to .rpi/current/research.md
```

### 2️⃣ Planning Phase
```bash
# Copy your research + .rpi/prompts/[your-ai]/plan.md to your AI
# AI creates atomic tasks based on research
# Save output to .rpi/current/plan.md
```

### 3️⃣ Implementation Phase
```bash
# Copy your plan + .rpi/prompts/[your-ai]/implement.md to your AI
# AI helps implement each task systematically
# Track progress in .rpi/current/progress.md
```

## 🎉 What You Get

```
.rpi/
├── templates/          # Clean, simple templates
├── prompts/           # AI-specific prompts that actually work
├── current/           # Your active work
└── examples/          # Real-world example to learn from
```

That's it. No CLI to learn. No configuration. Just better AI-assisted development.

## 🌟 Why RPI Works

### Before RPI (Chaos)
- 🔥 Long, meandering AI conversations
- 🔥 Context pollution and confusion
- 🔥 Implementation surprises
- 🔥 Impossible code reviews
- 🔥 Lost in implementation details

### After RPI (Clarity)
- ✅ Structured, purposeful AI interactions
- ✅ Clean context for each phase
- ✅ Predictable, systematic progress
- ✅ Reviewable plans before coding
- ✅ Clear documentation of decisions

## 📊 Proven Results

This methodology has been used successfully on:
- 300,000+ line codebases
- Complex system integrations
- Team projects with multiple developers
- From simple features to architectural changes

## 🚦 Quick Example

**Research Output**: "We need rate limiting on our API endpoints to prevent abuse, supporting different limits for authenticated vs anonymous users..."

**Plan Output**: 
- Phase 1: Create rate limiter class with Redis backend
- Phase 2: Add middleware to Express routes
- Phase 3: Add monitoring and alerts

**Implementation**: Systematic execution with no surprises

## 🤝 Contributing

Found a better template? Improved a prompt? PRs welcome!

The best methodology evolves with community input.

## 📚 Learn More

- [Full Methodology Guide](docs/methodology.md)
- [AI Tool Tips](docs/ai-tools.md)
- [Example Workflows](examples/)

## ⚡ Try It Now

```bash
# Install in literally 10 seconds
curl -sSL https://raw.githubusercontent.com/yourusername/rpi-kit/main/install.sh | bash

# Start your first RPI cycle
echo "Add user authentication" > .rpi/current/topic.txt
cat .rpi/prompts/claude/research.md  # Copy to Claude Code
```

## 🎯 Philosophy

> "The best code is written before you write code."

RPI-Kit helps you think before you type, plan before you build, and ship with confidence.

## 📝 License

MIT - Use it, modify it, share it.

---

**Built by developers who were tired of chaotic AI conversations.**

⭐ Star this repo if RPI helps you build better software!