set shell := ["bash", "-eu", "-o", "pipefail", "-c"]

# List available recipes
default:
    @just --list

# Package bundle into build directory
[arg("args", help="Arguments passed to package.sh")]
package *args:
    @just oras package {{args}}

# Push a previously packaged bundle
[arg("args", help="Arguments passed to push.sh")]
push *args:
    @just oras push {{args}}

# List the contents of a packaged bundle
[arg("bundle", help="Bundle name")]
inspect bundle:
    @tar tzvf build/bundles/{{bundle}}.tar.gz

# Remove the build directory
clean:
    @rm -rf build

# Run Claude inside Docker container
claude:
    @docker compose run --rm claude

# Run Codex inside Docker container
codex:
    @docker compose run --rm codex

# Lint shell scripts with shellcheck
[arg("args", help="Files to check (defaults to all scripts)")]
lint-sh *args:
    @scripts/lint.sh {{args}}

# Check shell script formatting with shfmt
[arg("args", help="Files to check (defaults to all scripts)")]
fmt-sh *args:
    @scripts/fmt.sh {{args}}

[private]
[arg("command", pattern="push|package")]
oras command *args:
    @docker compose run \
        --rm \
        --build \
        --user "$(id -u):$(id -g)" \
        oras {{command}} {{args}}
