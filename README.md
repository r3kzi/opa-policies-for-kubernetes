# Open Policy Agent and Kubernetes

Playing with [Open Policy Agent](https://www.openpolicyagent.org) Policies for Kubernetes.

## Installation

Please refer to [Running OPA](https://www.openpolicyagent.org/docs/latest/#running-opa)

## Testing

```
$ opa test -v .
data.kubernetes.validating.image.test_deny: PASS (2.23655ms)
data.kubernetes.validating.labels.test_bad_pod: PASS (2.273702ms)
data.kubernetes.validating.labels.test_good_pod: PASS (915.288µs)
data.kubernetes.validating.resources.test_requests: PASS (1.171086ms)
data.kubernetes.validating.resources.test_limits: PASS (978.667µs)
--------------------------------------------------------------------------------
PASS: 5/5
```

### Coverage

```
$ opa test --coverage -v . | jq 'to_entries | .[] |select(.key|test("coverage"))' 
{
  "key": "coverage",
  "value": 100
}
```
