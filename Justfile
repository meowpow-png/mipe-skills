set shell := ["bash", "-eu", "-o", "pipefail", "-c"]

# List available recipes
default:
    @just --list

# Package bundle into build directory
[arg("args", help="Arguments passed to package.sh")]
package *args:
    @docker compose run --rm oras package {{args}}

# Push a previously packaged bundle
[arg("args", help="Arguments passed to push.sh")]
push *args:
    @docker compose run --rm oras push {{args}}

# List the contents of a packaged bundle
[arg("bundle", help="Bundle name")]
inspect bundle:
    @tar tzvf build/bundles/{{bundle}}.tar.gz
