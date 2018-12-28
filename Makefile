
# enable auto documentation (https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html)
.PHONY: help
help: ## show this help message
	@grep --no-filename --extended-regexp '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "%-22s %s\n", $$1, $$2}'

.PHONY: quick
quick: ## run quick build
	@./mvnw --activate-profiles quick install
