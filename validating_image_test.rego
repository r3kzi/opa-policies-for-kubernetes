package kubernetes.validating.image

test_deny {
	deny["image 'alpine' comes from untrusted registry"] with input as pod
}

pod := {
	"kind": "AdmissionReview",
	"review": {
		"kind": {
			"kind": "Pod",
			"version": "v1",
		},
		"object": {
			"metadata": {"name": "images"},
			"spec": {"containers": [
				{
					"image": "rekzi/nginx",
					"name": "valid",
				},
				{
					"image": "alpine",
					"name": "not-valid",
				},
			]},
		},
	},
}
