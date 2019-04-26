# Flux and Istio Sample Repo

This is a simple demo of managing Istio with Flux. It is forked from
https://github.com/stefanprodan/gitops-istio with a few added changes.

## Installation

The simplest way to get started with it is to run the `minikube.sh` script, which will run a
minikube cluster with Flux and Istio. You will need minikube installed for it to work (or have a
cluster where you can deploy this).

You will need to fork this repo and generate your own deploy key to get the script to work
properly.

Use it with:
```
./minikube.sh <repo-name>
```

You will have to manually install Istio, since Flux is unable to install it, you can do that by
following the instructions here: https://istio.io/docs/setup/kubernetes/install/helm/.

You will have to install Istio before Flux, otherwise there will be some problems.

Note: Minikube requires a lot of memory to work properly with Istio. 8GB is recommended on the Istio
site and that seems to work.

## Sample Canary Deployment

There are two scripts in the root directory that script the process of rolling out a canary
deployment using Istio virtual services. They use some pre-defined templates in the `templates/`
directory and create and push a commit with those. The idea is to show how everything will be
managed through gitops and Flux.
