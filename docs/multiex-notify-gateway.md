# MULTEXPK Notify WhatsApp Gateway

MULTEXPK Notify is a Node.js-based WhatsApp multi-device gateway used as a messaging transport layer for applications and automation systems.

## Role

Application → Notify API → WhatsApp Session → WhatsApp → Delivery Events → Application

Typical integrations can include customer portals, billing systems, CRMs, notification services, and automation workflows.

## Multi-device architecture

The gateway should separate API authentication, WhatsApp session lifecycle, message submission, queue/worker processing, delivery events, retry/idempotency handling, tenant isolation, and observability.

Never publish real session databases, authentication state, QR/session artifacts, or customer message data.

## Node.js responsibilities

- REST API endpoints
- Authentication and authorization
- Request validation
- Queue integration
- WhatsApp client/session management
- Webhook/event delivery
- Logging and correlation IDs
- Health endpoints

## Reliability

Request → Validate → Queue → Send → Observe → Confirm → Record

An HTTP success response does not necessarily mean a WhatsApp message was delivered. Submission, provider acceptance, delivery, and read status are separate states.

## Operations

Monitor active sessions, reconnects, queue depth, send latency, provider errors, failed messages, worker health, and resource usage.

## Security

Protect API keys, session credentials, webhook secrets, phone numbers, message contents, and database credentials. Enforce tenant-level authorization.
