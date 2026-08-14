---
name: libgdx-logging
description: Logging guidance for LibGDX games. Use when adding, reviewing, or revising logging.
---

Apply these rules when adding or reviewing logging:

- Prefer transition logs over repeated state snapshots
- Keep messages concise, specific, and useful for reproducing behavior
- Avoid logging the same event at multiple layers

## Levels

### Debug

Use for diagnostic information that explains internal decisions or behavior.

Typical examples:

- pathfinding or routing decisions
- AI or controller decisions
- why an action was skipped, rejected, or retried

Debug logs should be low-frequency by default.

### Info

Use for significant lifecycle events and successful high-level operations.

Typical examples:

- application, screen, or simulation startup and shutdown
- major state transitions
- operation started or completed

### Warn

Use when something unexpected happens but execution can continue safely.

Typical examples:

- fallback behavior
- recoverable invalid input or state
- failed optional operation

### Error

Use when an operation fails or an invalid state prevents correct execution.

## Runtime Logging

- Do not log every frame, tick, render pass, or update cycle
- Prefer state changes, decisions, and failures over repeated state snapshots
- Temporary high-frequency diagnostics must be removed after investigation

## Ownership and Failures

- Log events at their authoritative source and avoid duplicate logs across layers
- Log exceptions once, with enough context to explain the failure, and preserve the throwable
- Do not use exceptions as normal control flow

## Performance

- Check the log level before expensive formatting or computation
- Avoid building strings eagerly for disabled logs
- Avoid unnecessary allocations in hot paths
- Keep logging out of per-frame and per-tick loops by default
- Do not add high-volume logs to rendering, pathfinding, collision, or AI loops
- Use temporary high-frequency logging only for targeted diagnostics
