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

cheatsheets: cheatsheet-deps ## Generate cheatsheets.

slides: slides/ansible.md slides/git.md ## Generate slides.
	marp --pdf --pdf-notes --html --allow-local-files slides/*.md

cheatsheet-deps: \
	cheatsheets/cs-ansible.pdf \
	cheatsheets/cs-ansible-playbook.pdf \
	cheatsheets/cs-ansible-inventory.pdf \
	cheatsheets/cs-ansible-vault.pdf \
	cheatsheets/cs-ansible-galaxy.pdf \
	cheatsheets/cs-linux-cli.pdf

cheatsheets/cs-ansible.pdf: cheatsheets/cs-ansible.md
	pandoc cheatsheets/cs-ansible.md -o cheatsheets/cs-ansible.pdf --template eisvogel --listings

cheatsheets/cs-ansible-playbook.pdf: cheatsheets/cs-ansible-playbook.md
	pandoc cheatsheets/cs-ansible-playbook.md -o cheatsheets/cs-ansible-playbook.pdf --template eisvogel --listings

cheatsheets/cs-ansible-inventory.pdf: cheatsheets/cs-ansible-inventory.md
	pandoc cheatsheets/cs-ansible-inventory.md -o cheatsheets/cs-ansible-inventory.pdf --template eisvogel --listings

cheatsheets/cs-ansible-vault.pdf: cheatsheets/cs-ansible-vault.md
	pandoc cheatsheets/cs-ansible-vault.md -o cheatsheets/cs-ansible-vault.pdf --template eisvogel --listings

cheatsheets/cs-ansible-galaxy.pdf: cheatsheets/cs-ansible-galaxy.md
	pandoc cheatsheets/cs-ansible-galaxy.md -o cheatsheets/cs-ansible-galaxy.pdf --template eisvogel --listings

cheatsheets/cs-linux-cli.pdf: cheatsheets/cs-linux-cli.md
	pandoc cheatsheets/cs-linux-cli.md -o cheatsheets/cs-linux-cli.pdf --template eisvogel --listings

.venv/bin/activate: requirements.lock
	python3 -m venv .venv
	./.venv/bin/pip install ${PIP_OPTIONS} -U pip
	./.venv/bin/pip install ${PIP_OPTIONS} -r requirements.lock
	./.venv/bin/ansible-galaxy install -cr requirements.yml
