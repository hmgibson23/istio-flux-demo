#!/usr/bin/env sh

minikube start -p fluxstio --memory=4096 --cpus=2

kubectl -n kube-system create sa tiller

kubectl create clusterrolebinding tiller-cluster-rule \
    --clusterrole=cluster-admin \
    --serviceaccount=kube-system:tiller

helm init --skip-refresh --upgrade --service-account tiller

echo "Waiting for helm..."
sleep 60

helm repo add weaveworks https://weaveworks.github.io/flux

helm install --name flux \
    --set helmOperator.create=true \
    --set git.url=git@github.com:hmgibson23/istio-flux-demo \
    --set git.chartsPath=charts \
    --namespace flux \
    weaveworks/flux

# wait for it for it to be ready
echo "Waiting for flux... by sleeping for two minutes. It may take longer."
echo "Run: watch kubectl get pods -n flux to check the progress."
sleep 120
