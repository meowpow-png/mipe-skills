# Unit Testing

## Annotations

Use these annotations consistently:

- `@Test` for JUnit tests
- `@Nested` to group related scenarios
- `@DisplayName` for readable test reports

## Naming

### Test classes

- Top-level test classes use the production class name and end with `Test`
- Nested test classes use plural names and end with `Tests`
- Nested classes for a production method use `<methodName>MethodTests`
- The nested class `@DisplayName` matches the production method name

### Test methods

Use:

```text
should_<expected_behavior>_when_<condition>
```

### Display names

Describe the observable behavior in natural language.

### Lifecycle methods

Name lifecycle methods after the tests they prepare or clean up.

## Structure

Use Arrange-Act-Assert.

Do not add `// arrange`, `// act`, or `// assert` comments.

## Candidates

Choose classes with meaningful behavior that can be tested in isolation
without Spring, a database, the network, or other external infrastructure.

Good candidates include:

- Services with business logic
- Validators
- Mappers with non-trivial logic
- Parsers and converters
- Utility classes with meaningful behavior
- Authentication and authorization components
- Retry, scheduling, or synchronization logic

Poor candidates include:

- DTOs and simple records
- JPA entities
- Spring Data repositories
- Configuration properties
- Constant holders
- Generated code
- Thin wrappers that only delegate

## Behavior

- Plan tests from the behavioral contracts of the public API
- Each test verifies one observable behavior
- Do not test implementation details, private methods, or internal state
- Use one representative case when multiple inputs produce the same behavior
- Stop once all meaningful behaviors are covered

## Setup

- Keep setup local and minimal
- Use helper methods only when they improve readability
- Avoid shared mutable fixtures
- Prefer existing fixtures to rebuilding common test objects or configuration

## Mocking

- Use mocks only to isolate collaborators
- Stub only behavior required by the test
- Prefer simple fakes when they clarify the test

## Assertions

- Use AssertJ for value and exception assertions
- Prefer the most direct assertion for the expected behavior
- Assert specific exception types rather than broader parent types

## Source set

- Unit tests live in `src/test/java`
- Shared fixtures live in `src/testFixtures/java`
