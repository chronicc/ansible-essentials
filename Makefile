.DEFAULT_GOAL := help

.PHONY: help
help:
	@echo ""
	@echo "Usage: make TARGET"
	@echo ""
	@echo "Targets"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: clean
clean: ## Clean up the repository.
	rm -rf .pytest_cache
	rm -rf .vagrant
	rm -rf .venv
	find -iname "*.pyc" -delete

install: .venv/bin/activate ## Install requirements for this repository.

.venv/bin/activate: requirements.lock
	python3 -m venv .venv
	./.venv/bin/pip install -U pip
	./.venv/bin/pip install -r requirements.lock
	./.venv/bin/ansible-galaxy install -r requirements.yml
