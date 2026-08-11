---
name: javadoc
description: Write or review javadoc. Use when writing, adding, or reviewing javadoc for a specific class.
---

Write or review javadoc for the given class.

## Conventions

### Summaries

Keep top-level descriptions short. Explain only what is not obvious.

- Say what the type represents in one short line
- For classes, describe the domain role, not the fields or behavior
- Use domain terms instead of describing the code
- Keep enum constant docs only when they explain something meaningful

### Records

- Records: full description and one `@param` per component live on the header only
- Compact constructors: `@throws` tags only, no repeated prose, no `@param`

### Constructors

- Regular constructors get a one-line summary of what they create
- Regular constructors include all required `@param` and `@throws` tags
- Private constructors need no javadoc unless something non-obvious needs explaining

### Method visibility

- Document public and protected methods using these conventions
- Private methods need no javadoc unless something non-obvious needs explaining
- Any method with `@param` tags, including setters and mutators, also needs a one-line summary of what it does

### Prose

- Wrap parameter names in `{@code}` when referring to them in prose
- For null checks on 3+ parameters, say "if any argument is null"; for two parameters, name them
- Do not say "must not be null" when nullness is already defined at the package or class level
- Keep `@throws NullPointerException` when the contract guarantees it
- Do not spell out lists of domain members in prose; describe the concept instead
- Do not use em dashes

### Level of detail

- Describe what something means, not how the code implements it
- Do not repeat implementation details that are obvious from the code
- Refer to fields, methods, or types only when needed to remove ambiguity
- Do not repeat the same fact across javadocs in the same file
- `@return` describes only the returned value, not how callers use it
- Use `@return` only when the returned value needs clarification
- A simple accessor may omit the summary when its only tag is `@return` and that tag fully describes the method
- For obvious getters, use a one-line summary instead of an `@return` tag

### API notes

Use when a summary needs elaboration on a behavior a caller can actually rely on.

```
<p>
<strong>API Note:</strong>
...caller-facing guarantee...
```

### Implementation notes

Use when a summary needs elaboration on internal
mechanism or rationale that could change without notice.

```
<p>
<strong>Implementation Note:</strong>
...internal mechanism/rationale, may change without notice...
```

## Workflow

- Read the class and find every runtime check it performs
- Find any documented invariants that the code does not enforce and flag them for review
- Write or update the javadoc to match these conventions and the behavior the code actually enforces
- Validate the finished javadoc against all conventions outlined in this skill
