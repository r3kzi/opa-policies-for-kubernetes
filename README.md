# Open Policy Agent and Kubernetes

Playing with [Open Policy Agent](https://www.openpolicyagent.org) Policies for Kubernetes.

## Installation

Please refer to [Running OPA](https://www.openpolicyagent.org/docs/latest/#running-opa).

### Kubernetes

You can use [Gatekeeper](https://github.com/open-policy-agent/gatekeeper) to run OPA within Kubernetes.

Gatekeeper uses the [OPA Constraint Framework](https://github.com/open-policy-agent/frameworks/tree/master/constraint) 
to describe and enforce policy.

## Testing

```
$ opa test -v *.rego           
data.kubernetes.validating.image.test_deny: PASS (1.538124ms)
data.kubernetes.validating.labels.test_bad_pod: PASS (1.335433ms)
data.kubernetes.validating.labels.test_good_pod: PASS (1.108388ms)
data.kubernetes.validating.resources.test_requests: PASS (1.4341ms)
data.kubernetes.validating.resources.test_limits: PASS (1.173867ms)
--------------------------------------------------------------------------------
PASS: 5/5
```

### Coverage

```
$ opa test --coverage -v *.rego | jq 'to_entries | .[] |select(.key|test("coverage"))' 
{
  "key": "coverage",
  "value": 100
}
```
