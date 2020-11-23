check-container-registry-account-id:
	./scripts/check_container_registry_account_id

build-and-publish: 
	./scripts/build_and_publish

.PHONY: build-and-publish check-container-registry-account-id
