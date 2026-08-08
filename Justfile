set shell := ["bash", "-eu", "-o", "pipefail", "-c"]

import "just/agent.just"
import "just/bundle.just"
import "just/quality.just"

# List available recipes
default:
    @just --list

# Remove the build directory
clean:
    @rm -rf build
