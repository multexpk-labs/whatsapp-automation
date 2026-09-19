# WhatsApp Automation

Engineering patterns for WhatsApp business messaging, APIs, notifications, automation, integrations, queues, webhooks, and reliable communication systems.

## Scope

This repository studies practical messaging infrastructure:

- WhatsApp Cloud API integrations
- Business notifications
- Template-based messaging
- Customer communication workflows
- Webhooks
- Delivery/read status tracking
- Queues and workers
- Retries and idempotency
- Consent/opt-in management
- Rate limiting
- Audit logging
- Security and troubleshooting

## Reference Architecture

`Business Event → Notification Service → Queue → WhatsApp Adapter → Provider/API → Delivery Status → Application`

Keep business logic separate from provider-specific transport code.

## WhatsApp Cloud API

A production integration typically handles:

- Authentication and token management
- Phone-number configuration
- Templates
- Text/media messages
- Webhooks
- Delivery/read statuses
- Provider errors
- Rate limits
- Audit records

See [Cloud API integration](docs/cloud-api.md).

## Message Lifecycle

`Queued → Sending → Accepted → Delivered → Read`

Failure states may include rejected, failed, expired, or cancelled.

Persist provider message IDs so asynchronous delivery events can be correlated with the original message.

## Queues & Reliability

Messaging should normally be asynchronous:

`Business Event → Queue → Worker → Provider → Result`

Use durable job IDs, bounded retries, backoff, idempotency, and dead-letter handling.

Do not retry every error indefinitely. Temporary network failures and permanent authentication/policy errors require different handling.

## Templates & Consent

Maintain records for:

- Contact/customer identifier
- Consent or opt-in state
- Template identifier/version
- Message purpose
- Timestamp
- Delivery outcome

Avoid unsolicited bulk messaging. Template versions should remain traceable for historical audit.

## Security

Protect:

- API access tokens
- Webhook secrets
- Customer phone numbers
- Message contents
- Media
- Session credentials
- Database credentials

Never publish real WhatsApp session files, tokens, customer contact lists, or message histories.

## Troubleshooting

Use:

**Observe → Correlate → Diagnose → Test → Change → Verify → Document**

For a failed message, inspect application event, queue state, authentication, provider response, recipient format, template requirements, rate limits, and worker health.

Use request/message/job IDs for correlation rather than relying on phone numbers.

## Practical Resources

- `bash/whatsapp-health.sh` — host diagnostics
- `python/message_fixture.py` — synthetic message fixture
- `examples/webhook.json` — synthetic status event
- `examples/message-request.json` — synthetic message request
- `tests/README.md` — testing strategy

All examples use synthetic data.

## Testing

Recommended coverage:

- Request validation
- Recipient normalization
- Template selection
- Consent/opt-in checks
- Provider authentication
- Message state transitions
- Idempotency
- Retry classification
- Webhook authentication
- Duplicate/out-of-order events
- Delivery status mapping
- Rate-limit handling

Use mocks, fixtures, sandboxes, and disposable test accounts. Never use real customer contacts or production tokens in public CI.

## Research & Reimplementation

**Find → Clone → Inspect → Understand → Document → Reimplement → Test → Improve**

When studying public WhatsApp integrations, check licensing and provider terms. Reimplement architecture and behavior independently rather than copying proprietary source.

## Related Repositories

- [ai-agents-automation](https://github.com/multexpk-labs/ai-agents-automation)
- [hosting-platform-engineering](https://github.com/multexpk-labs/hosting-platform-engineering)
- [whmcs-engineering](https://github.com/multexpk-labs/whmcs-engineering)
- [php-laravel-engineering](https://github.com/multexpk-labs/php-laravel-engineering)
- [payment-infrastructure](https://github.com/multexpk-labs/payment-infrastructure)

---

## MULTEXPK LABS

**Zain Ul Abddin — Founder, MULTEXPK LTD ®™**

Technical education, AI/LLM research, automation, infrastructure engineering, and practical software development.

**MULTEXPK LTD ®™ – Secure Cloud • VPS • Hosting • Automation**

https://multexpk.com | https://webvpsserver.com | WhatsApp: +92 312 6565434 | support@multexpk.com