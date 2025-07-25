# --- Install uv package manager
curl -Ls https://astral.sh/uv/install.sh | bash

# --- Start a venv
uv venv --clear
source .venv/bin/activate

# --- Recolor
uv pip install pillow
uv run recolor.py