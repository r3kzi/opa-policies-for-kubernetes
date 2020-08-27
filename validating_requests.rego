package kubernetes.validating.resources

deny[msg] {
    # We are only interested in Pods
    input.request.kind.kind == "Pod"

    # Check limits
    container := input.request.object.spec.containers[_]
    not container.resources.limits

    # If all above statements are true, return message  
    msg := sprintf("You must provide resources.limits for container: %v", [container.name])
}

deny[msg] {
    # We are only interested in Pods
    input.request.kind.kind == "Pod"

    # Check requests
    container := input.request.object.spec.containers[_]
    not container.resources.requests
     
    # If all above statements are true, return message
    msg := sprintf("You must provide resources.requests for container: %v", [container.name])
}