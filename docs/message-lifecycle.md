# Message Lifecycle

A useful internal state model is:

`Queued → Sending → Accepted → Delivered → Read`

Failure states may include:

- Rejected
- Failed
- Expired
- Cancelled

Provider terminology varies. Map external statuses into a stable internal model.

Persist provider message IDs so delivery events can be correlated with the original message.
