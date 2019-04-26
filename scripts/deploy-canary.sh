#!/usr/bin/env sh

WEIGHT=$1

if [ "$#" -ne 1 ]; then
    echo "Usage: deploy-canary.sh weight"
    exit 1
fi

S_WEIGHT=`expr 100 - $WEIGHT`
export WEIGHT=$WEIGHT S_WEIGHT=$S_WEIGHT
envsubst '$WEIGHT $S_WEIGHT' < ../templates/virtual-service-canary.yaml > ../workloads/podinfo/virtual-service.yaml

echo "Committing new virtual service with canary..."
commit_msg="Enable canary, weight: $WEIGHT"
git commit ../workloads/virtual-service.yaml -m "$commit_msg"

echo "Pushing commit..."
git push

echo "Now verify and turn off the canary when it's ready. Note that is may take some time for it to become available."
