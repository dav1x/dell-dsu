IMAGE ?= quay.io/dphillip/oot-ice-driver-ocp
RELEASE_VERSION ?= "8.4"
OCP_VERSION ?= "4.8"
TLS_VERIFY ?= false
KVER ?= $(uname -r)

make-dtk-install: 
  podman build -t $(IMAGE):$(KVER) Dockerfile.SRO --build-arg=KVER=$(KVER)
