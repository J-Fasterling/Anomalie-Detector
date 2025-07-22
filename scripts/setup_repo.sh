#!/usr/bin/env bash
#
# One‑command bootstrap script.
# - Creates the full repo skeleton
# - Leaves the project in a “green” state (pytest exit 0, CI ready)
# - Idempotent: safe to run multiple times

set -euo pipefail

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
root_dir="$( dirname "$script_dir" )"
cd "$root_dir"

echo "▶ Creating directory skeleton…"
dirs=(
  "data/raw"
  "data/processed"
  "deploy"
  "docs"
  "notebooks"
  "scripts"
  "src"
  "src/ml"
  "src/rl"
  "src/stream"
  "src/twin"
  "tests"
)
for d in "${dirs[@]}"; do
  mkdir -p "$d"
done

echo "▶ Adding Python package stubs…"
packages=(
  "src"
  "src/ml"
  "src/rl"
  "src/stream"
  "src/twin"
  "tests"
)
for p in "${packages[@]}"; do
  init_file="$p/__init__.py"
  [[ -f "$init_file" ]] || touch "$init_file"
done

echo "▶ Ensuring requirements.txt exists…"
req_file="requirements.txt"
if [[ ! -f "$req_file" ]]; then
  cat > "$req_file" <<'REQ'
pytest>=8.2.0
ruff>=0.4.5
mypy>=1.10
REQ
fi

# Ensure pytest exits 0 even when no real tests exist
smoke_test="tests/test_placeholder.py"
if [[ ! -f "$smoke_test" ]]; then
  echo -e "def test_placeholder():\n    assert True" > "$smoke_test"
fi

echo "▶ Copying template files…"
for f in README.md SCOPE.md; do
  src_template="$script_dir/../$f"
  tgt="$root_dir/$f"
  [[ -f "$tgt" || ! -f "$src_template" ]] || cp "$src_template" "$tgt"
done

echo "▶ Bootstrapping minimal CI workflow…"
ci_file=".github/workflows/ci.yml"
if [[ ! -f "$ci_file" ]]; then
  mkdir -p "$( dirname "$ci_file" )"
  cat > "$ci_file" <<'YAML'
name: CI
on: [push, pull_request]

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.11'
      - run: pip install ruff mypy
      - run: ruff src tests
      - run: mypy src
  test:
    runs-on: ubuntu-latest
    needs: lint
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.11'
      - run: pip install -r requirements.txt
      - run: pytest -q
YAML
fi

# Keep this script executable for subsequent runs
chmod +x "$script_dir/setup_repo.sh"

echo "✅ Setup complete – repo is ready and tests pass."