#!/bin/bash

# =============================================================================
# AI Text Enhancer Setup Script
# Instructions: 
# 1. Make sure you have python3 installed (sudo apt install python3)
# 2. Place this script in the same folder as 'system_enhancer.py'
# 3. Run: ./setup_environment.sh
# =============================================================================

# Exit immediately if any command fails
set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PYTHON_SCRIPT="${SCRIPT_DIR}/system_enhancer.py"

echo "============================================================="
echo "  AI Text Enhancer Setup and Launcher"
echo "============================================================="

# --- Dependency Check ---
if ! command -v python3 &> /dev/null; then
    echo "❌ ERROR: python3 command not found."
    echo "Please install Python 3 first (e.g., sudo apt update && sudo apt install python3)."
    exit 1
fi

# --- 1. Virtual Environment Setup ---
VENV_DIR=".venv"
if [ ! -d "$VENV_DIR" ]; then
    echo "✅ Creating isolated Python virtual environment in '$VENV_DIR'..."
    python3 -m venv "$VENV_DIR"
else
    echo "✅ Virtual environment already exists at '$VENV_DIR'. Skipping creation."
fi

# Activate the environment for subsequent commands
echo "Activating virtual environment..."
source "$VENV_DIR/bin/activate"

# --- 2. Dependency Installation ---
# NOTE: Add any necessary libraries here (e.g., pip install pandas)
echo "Installing required Python packages..."
# For this example, we assume no extra packages are needed beyond standard library usage.
# If you use libraries like 'requests' or 'numpy', uncomment the line below:
# pip install requests numpy

# --- 3. Execution ---
echo -e "\n============================================================"
echo "Setup Complete. Running the application now..."
echo "============================================================"

# Execute the main script using the activated environment's Python interpreter
python "$SCRIPT_DIR/system_enhancer.py"

# --- 4. Cleanup ---
echo -e "\n============================================================"
echo "Application finished."
deactivate
echo "Environment deactivated. You can now run the script manually by typing: source $(pwd)/venv/bin/activate && python your_main_script.py"
echo "============================================================"