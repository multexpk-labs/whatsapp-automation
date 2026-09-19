# Troubleshooting

Use evidence-first diagnostics.

## Messages Not Sending

Check:

1. Application event
2. Queue/job state
3. Authentication
4. Provider response
5. Recipient format
6. Template requirements
7. Rate limits
8. Worker health

## Sent But Not Delivered

Check:

- Provider message ID
- Delivery webhook
- Recipient status
- Provider error code
- Template/policy result
- Network/API latency

Always correlate logs using a request/message/job ID rather than a phone number alone.
