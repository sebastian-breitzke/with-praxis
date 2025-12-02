#!/bin/bash
#
# withPraxis Installer
# Installs the Praxis framework for Claude Code
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
PRAXIS_HOME="${PRAXIS_HOME:-$HOME/praxis}"
CLAUDE_DIR="$HOME/.claude"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  withPraxis Installer v2.0${NC}"
echo -e "${BLUE}  Your AI in practice${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Check for Claude Code
if ! command -v claude &> /dev/null; then
    echo -e "${YELLOW}⚠ Claude Code not found in PATH${NC}"
    echo "  Install Claude Code first: https://claude.ai/code"
    echo "  Then run this installer again."
    echo ""
    read -p "Continue anyway? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Step 1: Create Praxis home directory
echo -e "${BLUE}[1/4]${NC} Creating Praxis home directory..."
if [ -d "$PRAXIS_HOME" ]; then
    echo -e "  ${YELLOW}Directory exists:${NC} $PRAXIS_HOME"
else
    mkdir -p "$PRAXIS_HOME"
    echo -e "  ${GREEN}Created:${NC} $PRAXIS_HOME"
fi

mkdir -p "$PRAXIS_HOME/context"
mkdir -p "$PRAXIS_HOME/patterns"

# Step 2: Create Claude directory if needed
echo -e "${BLUE}[2/4]${NC} Setting up Claude Code directory..."
if [ ! -d "$CLAUDE_DIR" ]; then
    mkdir -p "$CLAUDE_DIR"
    echo -e "  ${GREEN}Created:${NC} $CLAUDE_DIR"
else
    echo -e "  ${YELLOW}Exists:${NC} $CLAUDE_DIR"
fi

mkdir -p "$CLAUDE_DIR/commands"

# Step 3: Copy commands
echo -e "${BLUE}[3/4]${NC} Installing commands..."
if [ -d "$SCRIPT_DIR/commands" ]; then
    # Create command subdirectories
    mkdir -p "$CLAUDE_DIR/commands/px/meeting"
    mkdir -p "$CLAUDE_DIR/commands/doc/validate"
    mkdir -p "$CLAUDE_DIR/commands/dev"

    # Copy all commands preserving structure
    cp -r "$SCRIPT_DIR/commands/"* "$CLAUDE_DIR/commands/" 2>/dev/null || true

    # Count commands
    CMD_COUNT=$(find "$CLAUDE_DIR/commands" -name "*.md" | wc -l | tr -d ' ')
    echo -e "  ${GREEN}Installed $CMD_COUNT commands to:${NC} $CLAUDE_DIR/commands/"
else
    echo -e "  ${YELLOW}No commands to install${NC}"
fi

# Step 4: Install telemetry tool (self-improvement engine)
echo -e "${BLUE}[4/4]${NC} Installing telemetry tool..."
mkdir -p "$PRAXIS_HOME/tools"
if [ -f "$SCRIPT_DIR/tools/telemetry" ]; then
    cp "$SCRIPT_DIR/tools/telemetry" "$PRAXIS_HOME/tools/telemetry"
    chmod +x "$PRAXIS_HOME/tools/telemetry"
    echo -e "  ${GREEN}Installed:${NC} $PRAXIS_HOME/tools/telemetry"

    # Initialize telemetry database
    "$PRAXIS_HOME/tools/telemetry" init 2>/dev/null || true
    echo -e "  ${GREEN}Initialized:${NC} Telemetry database"

    # Add to PATH hint
    if [[ ":$PATH:" != *":$PRAXIS_HOME/tools:"* ]]; then
        echo -e "  ${YELLOW}Tip:${NC} Add to your shell config:"
        echo -e "       export PATH=\"\$HOME/praxis/tools:\$PATH\""
    fi
else
    echo -e "  ${YELLOW}No telemetry tool to install${NC}"
fi

# Copy initial CLAUDE.md if it doesn't exist
if [ ! -f "$CLAUDE_DIR/CLAUDE.md" ]; then
    if [ -f "$SCRIPT_DIR/system/CLAUDE.md" ]; then
        cp "$SCRIPT_DIR/system/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
        echo -e "  ${GREEN}Installed:${NC} CLAUDE.md"
    fi
fi

# Copy context templates
echo ""
echo -e "${BLUE}[+]${NC} Copying context templates..."
if [ -d "$SCRIPT_DIR/context" ]; then
    for file in "$SCRIPT_DIR/context/"*.md; do
        if [ -f "$file" ]; then
            filename=$(basename "$file")
            if [ ! -f "$PRAXIS_HOME/context/$filename" ]; then
                cp "$file" "$PRAXIS_HOME/context/$filename"
                echo -e "  ${GREEN}Created:${NC} $PRAXIS_HOME/context/$filename"
            else
                echo -e "  ${YELLOW}Exists:${NC} $PRAXIS_HOME/context/$filename"
            fi
        fi
    done
fi

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  Installation complete!${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "Next steps:"
echo ""
echo "  1. Start Claude Code:"
echo -e "     ${BLUE}claude${NC}"
echo ""
echo "  2. Run the guided setup:"
echo -e "     ${BLUE}/px:setup${NC}"
echo ""
echo "  Praxis will ask you 5 questions and configure"
echo "  your personalized AI partner."
echo ""
echo -e "Commands available:"
echo -e "  ${BLUE}/px:setup${NC}            - Initial configuration"
echo -e "  ${BLUE}/px:research${NC}         - Structured research"
echo -e "  ${BLUE}/px:sanitize${NC}         - Clean up dictations"
echo -e "  ${BLUE}/px:meeting:analyze${NC}  - Analyze meetings"
echo -e "  ${BLUE}/doc:write${NC}           - Create documentation"
echo -e "  ${BLUE}/doc:polish${NC}          - Polish documentation"
echo -e "  ${BLUE}/dev:implement${NC}       - 5-phase dev pipeline"
echo ""
echo -e "Learn more: ${BLUE}https://github.com/sebastian-breitzke/with-praxis${NC}"
echo ""
