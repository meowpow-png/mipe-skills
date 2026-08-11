---
name: java-unit-tests
description: Discover classes suitable for unit testing and write complete test suites for them. Use when identifying unit test candidates or writing, adding, or completing unit tests.
---

Discover suitable unit test candidates, then write complete unit test suites for them.

## Setup

- Read `TESTING.md` located in the same directory as this skill
- Read existing unit test classes to understand the project's testing style
- If available, read classes in `testFixtures` module to discover available fixtures

## Workflow

### Plan candidates

- Analyze the repository for classes suitable for unit testing
- For each candidate, give one concise sentence explaining why it should be tested
- Identify all suitable candidates before writing tests

### Write tests

- Work through the planned candidates
- Read only production classes that are part of each candidate's public API
- Analyze each class according to the unit testing guidance
- Write one focused test for each meaningful contract
- Stop once all meaningful behaviors have been verified

## Constraints

- Use representative test cases and avoid redundant permutations
- Preserve the project's coding, testing, and formatting conventions
- If a required production class is not available on the test classpath,
  add it to `build.gradle.kts` instead of using reflection or other workarounds
- Do not run tests unless specifically requested to do so
