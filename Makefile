IMAGE ?= quay.io/dphillip/dell-dsu
RELEASE_VERSION ?= "8.4"
OCP_VERSION ?= "4.8"
TLS_VERIFY ?= false
KVER ?= $(uname -r)

dtk-install: 
	podman build -f Dockerfile.SRO --build-arg=KVER="${KVER}" .

dtk-install-external: 
	podman build -f Dockerfile.SRO -t $(IMAGE):$(KVER)--build-arg=KVER="${KVER}" .
  
local-install:
	podman build -t localhost/dsu-local .
