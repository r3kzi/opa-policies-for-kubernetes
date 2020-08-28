package kubernetes.validating.resources

test_requests {
	deny["You must provide resources.requests for container: only-limits"] with input as pod
}

test_limits {
	deny["You must provide resources.limits for container: only-requests"] with input as pod
}

pod := {
	"kind": "AdmissionReview",
	"request": {
		"kind": {
			"kind": "Pod",
			"version": "v1",
		},
		"object": {
			"metadata": {"name": "requests-and-limits"},
			"spec": {"containers": [
				{
					"image": "nginx",
					"name": "requests-and-limits",
					"resources": {
						"limits": {
							"cpu": "100m",
							"memory": "256Mi",
						},
						"requests": {
							"cpu": "50m",
							"memory": "128Mi",
						},
					},
				},
				{
					"image": "nginx",
					"name": "only-limits",
					"resources": {"limits": {
						"cpu": "100m",
						"memory": "256Mi",
					}},
				},
				{
					"image": "nginx",
					"name": "only-requests",
					"resources": {"requests": {
						"cpu": "100m",
						"memory": "256Mi",
					}},
				},
			]},
		},
	},
}
