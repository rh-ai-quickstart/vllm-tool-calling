NAMESPACE ?= vllm-tool-calling
MODEL ?= granite3.2-8b
PLATFORM ?= cpu
KUSTOMIZE_PATH ?= vllm-tool-calling/$(MODEL)/$(PLATFORM)

.PHONY: install uninstall

install:
	oc project $(NAMESPACE) || oc new-project $(NAMESPACE)
	oc apply -k $(KUSTOMIZE_PATH) -n $(NAMESPACE)

uninstall:
	oc delete -k $(KUSTOMIZE_PATH) -n $(NAMESPACE) --ignore-not-found
