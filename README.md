# WhatsApp Automation

Engineering patterns for WhatsApp business messaging, Node.js gateways, APIs, CRM systems, campaign automation, notifications, integrations, queues, webhooks, and reliable communication systems.

## MULTEXPK WhatsApp Stack

MULTEXPK works with several WhatsApp integration layers, each serving a different purpose:

| Component | Role |
|---|---|
| **MULTEXPK Notify** | Node.js multi-device WhatsApp gateway and messaging API |
| **Whatsham / Node.js tooling** | API-based WhatsApp message sending and marketing automation |
| **Evolution API** | WhatsApp integration/provider layer |
| **Meta WhatsApp API** | Official business API integration |
| **cloudapi.multex.pk** | MULTEXPK CRM for API messaging, contacts, campaigns, and branded WhatsApp communication |

The architecture keeps business applications separate from WhatsApp transport where practical.

## Reference Architecture

Business Application / CRM → Provider Adapter → WhatsApp Transport → WhatsApp → Webhooks → Application

For the MULTEXPK CRM:

Customer → cloudapi.multex.pk → Meta WhatsApp API → WhatsApp → Webhooks → CRM

For a custom multi-device gateway:

Application → Notify API → Node.js WhatsApp Session → WhatsApp → Delivery Events → Application

## MULTEXPK Notify Gateway

MULTEXPK Notify is a Node.js-based multi-device WhatsApp gateway used as a messaging transport layer for applications, automation, customer notifications, and integrations.

See [MULTEXPK Notify Gateway](docs/multiex-notify-gateway.md).

Important engineering boundaries include API authentication, session lifecycle, queue/worker processing, delivery events, retries, idempotency, tenant isolation, and observability.

Never publish real session databases, QR/session artifacts, credentials, customer contacts, or message history.

## Whatsham / Node.js Messaging

MULTEXPK also uses Node.js-based Whatsham-style tooling for sending messages through an API and supporting WhatsApp marketing workflows.

See [Whatsham / Node.js](docs/whatsham-nodejs.md).

Campaign systems should track audience, consent/opt-in, content, scheduling, queue jobs, send attempts, provider IDs, delivery results, and failures. Marketing automation must respect applicable WhatsApp policies, consent requirements, opt-outs, and provider limits.

## Evolution API

Evolution API is another integration layer used in the MULTEXPK WhatsApp stack.

See [Evolution API integration](docs/evolution-api.md).

Treat it as a provider boundary so CRM/business logic does not become tightly coupled to one WhatsApp transport.

## cloudapi.multex.pk CRM

cloudapi.multex.pk is a MULTEXPK CRM built around the Meta WhatsApp API. It provides an application layer for businesses that need API-connected WhatsApp communication and campaign management.

Core areas include:

- Customer and contact management
- WhatsApp account/number management
- API-based messaging
- Message history
- Templates and branded message content
- Campaign management
- Audience selection
- Delivery/read tracking
- Webhook processing
- Campaign reporting
- Tenant isolation and access control

See [cloudapi.multex.pk CRM](docs/cloudapi-crm.md).

## Provider Architecture

The major integration approaches are documented in [Provider and Gateway Architecture](docs/provider-comparison.md).

The application should ideally expose a stable internal messaging interface while adapters handle provider-specific APIs and events.

## Message Lifecycle

Queued → Sending → Accepted → Delivered → Read

Failure states may include rejected, failed, expired, disconnected, or cancelled.

Persist provider message IDs so asynchronous delivery events can be correlated with the original request.

## Queues & Reliability

Messaging should normally be asynchronous:

Business Event → Queue → Worker → Provider → Result

Use durable job IDs, bounded retries, backoff, idempotency, and dead-letter handling. Do not retry every error indefinitely; temporary network failures and permanent authentication/policy errors require different handling.

## Meta WhatsApp API

A production Meta API integration typically handles authentication, phone-number configuration, templates, text/media messages, webhooks, delivery/read status, provider errors, and rate limits.

Provider credentials and webhook verification secrets must remain server-side.

## Templates, Consent & Campaigns

Maintain records for contact/customer identifier, consent or opt-in state, template/content version, campaign, message purpose, timestamp, and delivery outcome.

Avoid unsolicited bulk messaging. Campaign and template history should remain traceable for operational and compliance review.

## Security

Protect:

- API access tokens
- WhatsApp session credentials
- Webhook secrets
- Customer phone numbers
- Message contents and media
- Database credentials
- Campaign/customer data

Never publish real WhatsApp session files, tokens, customer contact lists, or production message histories.

## Troubleshooting

Use:

**Observe → Correlate → Diagnose → Test → Change → Verify → Document**

For a failed message, inspect the application event, queue state, authentication, provider response, recipient format, template requirements, rate limits, session/worker health, and webhook processing.

Use request/message/job IDs for correlation rather than relying on phone numbers.

## Practical Resources

- `bash/whatsapp-health.sh` — host diagnostics
- `python/message_fixture.py` — synthetic message fixture
- `examples/webhook.json` — synthetic status event
- `examples/message-request.json` — synthetic message request
- `tests/README.md` — testing strategy

All public examples use synthetic data.

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
- Campaign scheduling
- Multi-tenant authorization
- Provider adapter behavior

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