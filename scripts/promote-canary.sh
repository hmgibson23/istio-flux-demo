#!/usr/bin/env sh

# for now, I am just cheating and copying over the promoted canary image.
cp ../templates/virtual-service.yaml ../workloads/podinfo/virtual-service.yaml

echo "Promoting canary to stable..."
commit_msg="Canary -> Stable"
git commit ../workloads/virtual-service.yaml -m "$commit_msg"

echo "Pushing commit..."
git push

echo "The stable image is now deployed."
