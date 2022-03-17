#!make
-include .env
export

check-container-registry-account-id:
	./scripts/check_container_registry_account_id.sh

build-and-publish: check-container-registry-account-id
	./scripts/build_and_publish.sh

publish-specific: check-container-registry-account-id
	./scripts/build_and_publish_individual_image.sh $(IMAGE)

.PHONY: build-and-publish check-container-registry-account-id
