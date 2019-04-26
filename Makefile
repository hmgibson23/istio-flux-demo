ISTIO_VERSION=1.1.3

deploy_canary:
	./scripts/deploy-canary.sh

promote_canary:
	./scripts/deploy_canary.sh

# download istio to the current directory in case it needs to be installed manually
fetch_istio:
	curl -L https://git.io/getLatestIstio | sh -
