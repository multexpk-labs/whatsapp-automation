# WhatsApp Automation Architecture

A reliable messaging system should separate business logic from the WhatsApp transport layer.

## Reference Flow

`Business Event → Notification Service → Queue → WhatsApp Adapter → Provider/API → Delivery Status → Application`

Supporting components can include:

- Template management
- Contact/customer records
- Message queue
- Retry handling
- Delivery-status processing
- Audit logging
- Rate limiting
- Opt-in/consent records
- Admin dashboard

Keep provider-specific API details behind an adapter boundary.
