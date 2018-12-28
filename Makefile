
# enable auto documentation (https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html)
.PHONY: help
help: ## show this help message
	@grep --no-filename --extended-regexp '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %s\n", $$1, $$2}'

.PHONY: quick
quick: ## run quick build
	@./mvnw --activate-profiles quick install

.PHONY: release
release: TRAVIS_BUILD_NUMBER ?= 0
release: ## run release build
	./mvnw --batch-mode --activate-profiles release --define revision=$(TRAVIS_BUILD_NUMBER) install

.PHONY: license-fmt
license-fmt: ## add missing license headers
	@./mvnw license:format

.PHONY: versions-plugin-updates
versions-plugin-updates: ## show available updates for maven plugins
	@./mvnw versions:display-plugin-updates
