---
name: dev-docs
description: Writes developer project documentation. Use when documenting how a project is structured or works internally.
---

## Voice

Write like an experienced developer explaining the
project to another developer who is about to work on it.

Keep the voice practical, concise, and confident without
sounding formal, academic, casual, or conversational.

Prefer:

> Controllers accept HTTP requests and hand work off to services.
> Services own application logic and call repositories when they need data.

Avoid:

> The controller layer is responsible for receiving incoming HTTP
> requests and subsequently delegating the appropriate processing
> responsibilities to the service layer.

The second version sounds like a textbook
and uses more words without clarifying the design.

## Content

Focus on how things behave, how pieces relate, and why decisions matter.

Prefer concrete project details over generic explanation. Explain design,
behavior, and boundaries without turning documentation into a code tour.

Prefer:

> Jobs are queued in Redis and processed independently
> from API. Adding workers increases processing capacity.

Avoid:

> The system uses a robust and highly scalable architecture.

Explain the design instead of making claims about its quality.

## Implementation Detail

Use code references only when they help explain behavior or a design decision.

Avoid turning simple explanations into call traces:

> `OrderController` receives `POST /orders`, calls
> `OrderService#createOrder`, then returns `OrderResponse`.

Do not list classes, methods, fields, or packages unless the
specific names are important to understanding the project.

## Structure

- Keep sections focused and make each one add new information
- Break prose into short paragraphs (no walls of text)
- Use bullet points when they make information easier to scan
- Never end bullet points with a period

Avoid packing several examples, components, or class names into
a single sentence when they can be explained more clearly another way.

## Style

- No em dashes
- Avoid rhetorical asides
- Avoid slang or overly casual phrasing
- Avoid clever or conversational headings
- Avoid speaking in second person unless giving an explicit instruction
