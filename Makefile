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

slides: slides/ansible.md slides/git.md
	marp --pdf --pdf-notes --html --allow-local-files slides/*.md

.venv/bin/activate: requirements.lock
	python3 -m venv .venv
	./.venv/bin/pip install ${PIP_OPTIONS} -U pip
	./.venv/bin/pip install ${PIP_OPTIONS} -r requirements.lock
	./.venv/bin/ansible-galaxy install -cr requirements.yml
