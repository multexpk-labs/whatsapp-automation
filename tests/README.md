# WhatsApp Automation Tests

Use mocks, synthetic contacts, provider sandboxes, and fixture webhooks.

Recommended coverage:

- Request validation
- Recipient normalization
- Template selection
- Consent/opt-in checks
- Provider authentication
- Message state transitions
- Idempotency
- Retry classification
- Webhook signature validation
- Duplicate/out-of-order events
- Delivery status mapping
- Rate-limit handling

Never use real customer contacts, tokens, or message histories in public CI.
