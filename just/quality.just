# Run all quality checks
qualitycheck: lint-sh fmt-sh lint-md

# Lint shell scripts with shellcheck
[arg("args", help="Files to check (defaults to all scripts)")]
lint-sh *args:
    @scripts/lint.sh {{args}}

# Check shell script formatting with shfmt
[arg("args", help="Files to check (defaults to all scripts)")]
fmt-sh *args:
    @scripts/fmt.sh {{args}}

# Lint markdown formatting with dprint
[arg("args", help="Extra dprint check arguments")]
lint-md *args:
    @just dprint check {{args}}

# Format markdown files with dprint
[arg("args", help="Extra dprint fmt arguments")]
fmt-md *args:
    @just dprint fmt {{args}}

[private]
[arg("command", pattern="push|package")]
oras command *args:
    @docker compose run \
        --rm \
        --user "$(id -u):$(id -g)" \
        oras {{command}} {{args}}

[private]
[arg("command", pattern="check|fmt")]
dprint command *args:
    @docker compose run \
        --rm \
        --user "$(id -u):$(id -g)" \
        dprint {{command}} {{args}}
