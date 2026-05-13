
## cmd
```bash
# Install uv globally if not already installed
curl -sSfL https://astral.sh/install.sh | sh

# Initialize a new project (adds .gitignore, .python-version, pyproject.toml, etc.)
uv init project-api

# Add some dependencies into the project and update pyproject.toml
uv add --dev pytest ruff pre-commit mkdocs gitleaks fastapi pydantic

# Update the lock file with the latest versions of the dependencies
# (this will also create a .venv in your project directory if it doesn't exist)
uv sync

# (Opt‑in) explicitly create or recreate a venv in a custom path:
uv venv create .venv

# Activate the .venv yourself
# ──────────────────────────────────────────────
# On macOS/Linux:
source .venv/bin/activate
# On Windows (PowerShell):
.\.venv\Scripts\Activate.ps1
# On Windows (cmd.exe):
.\.venv\Scripts\activate.bat

```



## ref
+ [uv](https://github.com/astral-sh/uv)
+ [uv run](https://docs.astral.sh/uv/guides/scripts/#using-different-python-versions)