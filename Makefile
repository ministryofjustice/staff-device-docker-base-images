#!make
-include .env
export

check-container-registry-account-id:
	./scripts/check_container_registry_account_id.sh

build-and-publish: check-container-registry-account-id
	./scripts/build_and_publish.sh

.PHONY: build-and-publish check-container-registry-account-id
