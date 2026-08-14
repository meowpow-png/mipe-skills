---
name: libgdx-performance
description: Performance guidance for LibGDX games. Use when writing, reviewing, or revising performance-sensitive runtime code.
---

## Hot Path

A hot path is code executed very frequently during runtime, such as rendering,
simulation updates, pathfinding, collision checks, AI, and entity iteration.

Code that runs every frame, every tick, or repeatedly inside
tight loops should be treated as performance-sensitive.

## Rules

- Avoid hot-path allocations, especially collections, varargs, strings, and temporary objects
- Reuse collections, buffers, views, and mutable LibGDX objects where practical
- Prefer simple loops over streams, iterators, or capturing lambdas in hot paths
- Avoid boxing and prefer primitive-friendly APIs and collections where appropriate
- Do not create defensive copies or new read-only wrappers in hot paths
- Keep sorting, filtering, formatting, and other expensive work outside hot loops when possible
- Do not micro-optimize infrequent code or sacrifice readability without a clear runtime benefit
