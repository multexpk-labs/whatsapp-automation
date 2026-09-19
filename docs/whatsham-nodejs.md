# Whatsham / Node.js Messaging Layer

MULTEXPK also uses Node.js-based WhatsApp automation tooling, including a Whatsham-style API layer, for programmatic message sending and WhatsApp marketing workflows.

## Typical flow

Marketing/CRM Application → Node.js API → WhatsApp Session → Message → Status

The application layer should own business rules while the transport layer owns WhatsApp connectivity.

## API responsibilities

- Send text
- Send media
- Connection/session status
- Session management
- Delivery events
- Campaign operations
- Message result recording

## Marketing automation

Campaign systems should model contacts, consent/opt-in state, campaigns, content variants, scheduling, queue jobs, send attempts, provider message IDs, delivery status, and failure reasons.

Marketing automation must respect applicable WhatsApp policies, consent requirements, opt-outs, and provider limits.

## Scaling

Campaign → Audience Selection → Rate-Limited Queue → Workers → WhatsApp Adapter → Status Events

Use idempotency keys to prevent accidental duplicate sends.

Public examples must use synthetic contacts and placeholder credentials.
