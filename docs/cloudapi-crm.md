# cloudapi.multex.pk — WhatsApp CRM

cloudapi.multex.pk is a MULTEXPK CRM platform built around the Meta WhatsApp API for customer messaging and campaign management.

## Role

Customer → cloudapi.multex.pk CRM → Meta WhatsApp API → WhatsApp → Webhooks → CRM

The CRM provides an application layer for businesses that need API-connected WhatsApp communication.

## Core capabilities

- Customer/contact management
- WhatsApp account and number management
- API-based messaging
- Message history
- Templates and branded message content
- Campaign management
- Audience selection
- Delivery/read tracking
- Webhook processing
- Campaign reporting
- Access control and tenant isolation

## Meta API integration

CRM Request → Validate → Meta API → Provider Message ID → Webhook → Status Update

Provider credentials and webhook verification should remain server-side.

## Campaign management

Campaign → Audience → Message Variant → Queue → Send → Delivery → Read/Failure

Campaigns should enforce consent/opt-in requirements, opt-outs, applicable platform policies, rate limits, and auditability.

## API-first design

Customers can integrate their own software with authenticated APIs. API keys should be scoped, rotatable, revocable, and stored securely.

## Multi-tenant security

Customer A must never access Customer B contacts, messages, campaigns, tokens, or WhatsApp account data. Enforce tenant authorization at every application boundary.

## Testing

Public CI should use mock Meta API responses and synthetic contacts. Never commit real access tokens, phone numbers, message histories, or production webhook secrets.
