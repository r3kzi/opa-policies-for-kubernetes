package kubernetes.validating.labels

required := {"rekzi.io/bounded-context", "app.kubernetes.io/name"}

deny[msg] {
	# Check for Kubernetes Label
	provided := {label | input.request.object.metadata.labels[label]}

	# Try to match all required labels
	missing := required - provided
	count(missing) > 0

	# If all above statements are true, return message
	msg := sprintf("You must provide labels: %v", [missing])
}
