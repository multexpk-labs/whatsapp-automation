# WhatsApp Cloud API Integration

A production integration typically needs:

- Authentication/token management
- Phone-number configuration
- Template management
- Text/media messages
- Webhook handling
- Delivery/read status processing
- Error handling
- Rate limiting
- Audit logs

## Webhook Flow

`Receive → Authenticate → Validate → Deduplicate → Persist → Process`

Do not trust arbitrary inbound webhook requests.

Keep access tokens and application secrets outside source control.
