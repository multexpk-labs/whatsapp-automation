# Evolution API Integration

MULTEXPK also works with Evolution API as a WhatsApp integration layer.

## Reference architecture

CRM/Application → WhatsApp Adapter → Evolution API → WhatsApp → Webhooks → CRM

This keeps business logic separate from WhatsApp transport concerns.

## Integration responsibilities

- Instance/session lifecycle
- API authentication
- Message submission
- Media handling
- Webhook events
- Delivery/read states
- Retries and idempotency
- Connection health
- Error mapping

## Provider abstraction

A common application interface can expose connect, disconnect, sendText, sendMedia, getStatus, and handleWebhook operations. The implementation can use Evolution API, a custom Node.js gateway, or another supported transport.

## Security

Keep Evolution API credentials and instance identifiers private. Do not publish production URLs, API keys, session data, QR codes, or customer message records.

## Testing

Use mocks and synthetic webhook fixtures for CI. Test authentication failures, disconnected instances, duplicate events, provider errors, rate limits, retries, and successful message flows.
