package kubernetes.validating.image

deny[msg] {
	# We are only interested in Pods
	input.request.kind.kind == "Pod"

	# Check image
	image := input.request.object.spec.containers[_].image
	not startswith(image, "rekzi/")

	# If all above statements are true, return message
	msg := sprintf("image '%v' comes from untrusted registry", [image])
}
