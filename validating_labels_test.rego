package kubernetes.validating.labels

test_bad_pod {
	pod := {
		"kind": "AdmissionReview",
		"review": {
			"kind": {
				"kind": "Pod",
				"version": "v1",
			},
			"object": {
				"metadata": {
					"name": "labels",
					"labels": {"app.kubernetes.io/name": "example"},
				},
				"spec": {"containers": [{
					"image": "nginx",
					"name": "nginx-frontend",
				}]},
			},
		},
	}

	violations := deny["You must provide labels: {\"rekzi.io/bounded-context\"}"] with input as pod
	count(violations) > 0
}

test_good_pod {
	pod := {
		"kind": "AdmissionReview",
		"review": {
			"kind": {
				"kind": "Pod",
				"version": "v1",
			},
			"object": {
				"metadata": {
					"name": "labels",
					"labels": {
						"app.kubernetes.io/name": "example",
						"rekzi.io/bounded-context": "example",
					},
				},
				"spec": {"containers": [{
					"image": "nginx",
					"name": "nginx-frontend",
				}]},
			},
		},
	}

	violations := deny with input as pod
	count(violations) == 0
}
