#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Default virtual environment directory and requirements file
VENV_DIR=${1:-venv}
REQ_FILE=${2:-requirements.txt}

echo "🔧 Creating virtual environment in ./$VENV_DIR ..."
python3 -m venv "$VENV_DIR"
echo "✅ Virtual environment created."

# Activate the virtual environment
source "$VENV_DIR/bin/activate"
echo "🚀 Activated virtual environment."

# Upgrade pip
echo "⬆️ Upgrading pip ..."
pip install --upgrade pip

# Install dependencies if requirements file exists
if [ -f "$REQ_FILE" ]; then
    echo "📦 Installing dependencies from $REQ_FILE ..."
    pip install -r "$REQ_FILE"
    echo "✅ Dependencies installed."
else
    echo "⚠️ No requirements file found at $REQ_FILE. Skipping dependency install."
fi

# List installed packages
echo "📋 Installed packages:"
pip list

echo "virtual environment Setup complete.🎉"