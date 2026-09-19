# WhatsApp Provider and Gateway Architecture

MULTEXPK uses multiple WhatsApp integration approaches for different architectural roles.

| Integration | Primary role | Typical layer |
|---|---|---|
| MULTEXPK Notify | Custom multi-device Node.js gateway | Transport/API |
| Whatsham / Node.js tooling | API-driven messaging and automation | Transport/API |
| Evolution API | WhatsApp integration/provider layer | Transport/API |
| Meta WhatsApp API | Official business API integration | Provider/API |
| cloudapi.multex.pk | CRM, campaigns, customer management | Application/CRM |

These components are not interchangeable. The correct architecture depends on the business requirement, provider rules, account model, message type, and operational constraints.

## Design principle

CRM/business logic → provider abstraction → transport/provider → WhatsApp

This makes it possible to add or change a transport without rewriting campaign, customer, billing, or reporting logic.

## Evaluation dimensions

- Account/session model
- Official API requirements
- Authentication
- Message capabilities
- Webhook model
- Delivery status
- Media handling
- Rate limits
- Reliability
- Scaling
- Compliance requirements
- Operational ownership
