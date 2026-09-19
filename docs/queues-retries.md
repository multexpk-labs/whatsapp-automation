# Queues, Retries & Reliability

Messaging should normally be asynchronous.

## Workflow

`Business Event → Queue → Worker → Provider → Result`

Use:

- Durable job IDs
- Bounded retries
- Exponential backoff where appropriate
- Idempotency
- Dead-letter handling
- Provider error classification

Do not retry every error indefinitely. Authentication failures, invalid recipients, and policy errors generally require different handling from temporary network failures.
