#!/usr/bin/env python3
import json
import uuid
from datetime import datetime, timezone

message = {
    "message_id": str(uuid.uuid4()),
    "job_id": "example-job-001",
    "recipient": "+00000000000",
    "template": "example_template",
    "status": "queued",
    "created_at": datetime.now(timezone.utc).isoformat(),
    "synthetic": True,
}

print(json.dumps(message, indent=2))
