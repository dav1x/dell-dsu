IMAGE ?= quay.io/dphillip/dell-dsu
RELEASE_VERSION ?= "8.4"
OCP_VERSION ?= "4.8"
TLS_VERIFY ?= false
KVER ?= $(uname -r)

dtk-install:
	podman build --device /dev/fuse -f Dockerfile.SRO --build-arg=KVER="${KVER}" .

dtk-install-external:
	podman build --device /dev/fuse -f Dockerfile.SRO -t $(IMAGE):$(KVER)--build-arg=KVER="${KVER}" .

local-install:
	podman build --device /dev/fuse -t localhost/dsu-local .


###################
# Helm operations #
###################
helm-lint: helm
	cd charts/; \
	for repo in `ls -d */`; do \
		helm lint -f ./global-values.yaml $$repo; \
	done

helm-repo-index: helm-lint
	cd charts/; \
	for repo in `ls -d */`; do \
		helm package $$repo; \
		helm repo index . --url=cm://dell-dsu/$${repo%-*}-chart; \
	done

helm-create-config-map: helm-repo-index
	@for repo in `cd charts && ls -d */`; do  \
  		oc -n dell-dsu delete cm $${repo%-*}-chart > /dev/null ; \
		oc -n dell-dsu create cm $${repo%-*}-chart --from-file=charts/index.yaml --from-file=charts/$${repo%?}.tgz; \
	done

helm:
ifeq (, $(shell which helm))
	@{ \
	set -e ;\
	HELM_GEN_TMP_DIR=$$(mktemp -d) ;\
	cd $$HELM_GEN_TMP_DIR ;\
	curl https://get.helm.sh/helm-v3.6.0-linux-amd64.tar.gz -o helm.tar.gz ;\
	tar xvfpz helm.tar.gz ;\
	mv linux-amd64/helm /usr/local/bin ;\
	chmod +x /usr/local/bin/helm ;\
	rm -rf $$HELM_GEN_TMP_DIR ;\
	}
HELM=/usr/local/bin/helm
else
KUSTOMIZE=$(shell which helm)
endif
