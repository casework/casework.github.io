#!/usr/bin/make -f

# This software was developed at the National Institute of Standards
# and Technology by employees of the Federal Government in the course
# of their official duties. Pursuant to title 17 Section 105 of the
# United States Code this software is not subject to copyright
# protection and is in the public domain. NIST assumes no
# responsibility whatsoever for its use by other parties, and makes
# no guarantees, expressed or implied, about its quality,
# reliability, or any other characteristic.
#
# We would appreciate acknowledgement if the software is used.

SHELL := /bin/bash

# This search pattern for Python 3 prioritizes the system-default
# spelling of 'python3' last.  This is done to accommodate local
# development: at the time of this writing, the built-in system python3
# on macOS does not have virtualenv installed by default.
PYTHON3 ?= $(shell which python3.9 2>/dev/null || which python3.8 2>/dev/null || which python3.7 2>/dev/null || which python3.6 2>/dev/null || which python3 2>/dev/null)
ifeq ($(PYTHON3),)
$(error python3 not found)
endif

all: \
  .venv-pre-commit/var/.pre-commit-built.log \
  all-examples \
  all-migration-0.2.0 \
  all-ontology

.PHONY: \
  all-examples \
  all-migration-0.2.0 \
  all-ontology \
  check-examples \
  check-migration-0.2.0 \
  check-ontology \
  check-supply-chain \
  check-supply-chain-pre-commit \
  check-supply-chain-submodules

.dependencies.done.log: \
  .venv.done.log
	$(MAKE) \
	  --directory dependencies
	touch $@

.git_submodule_init.done.log: \
  .gitmodules
	git submodule init
	git submodule update
	$(MAKE) \
	  --directory dependencies/CASE-develop \
	  .lib.done.log
	$(MAKE) \
	  --directory dependencies/CASE-develop-2.0.0 \
	  .lib.done.log
	$(MAKE) \
	  --directory dependencies/CASE-unstable \
	  .git_submodule_init.done.log
	$(MAKE) \
	  --directory dependencies/CASE-unstable-2.0.0 \
	  .git_submodule_init.done.log
	touch $@

.venv.done.log: \
  .git_submodule_init.done.log \
  requirements.txt
	rm -rf venv
	$(PYTHON3) -m venv \
	  venv
	source venv/bin/activate \
	  && pip install \
	    --upgrade \
	    pip \
	    setuptools \
	    wheel
	source venv/bin/activate \
	  && pip install \
	    --requirement requirements.txt
	touch $@

# This virtual environment is meant to be built once and then persist, even through 'make clean'.
# If a recipe is written to remove this flag file, it should first run `pre-commit uninstall`.
.venv-pre-commit/var/.pre-commit-built.log:
	rm -rf .venv-pre-commit
	test -r .pre-commit-config.yaml \
	  || (echo "ERROR:Makefile:pre-commit is expected to install for this repository, but .pre-commit-config.yaml does not seem to exist." >&2 ; exit 1)
	$(PYTHON3) -m venv \
	  .venv-pre-commit
	source .venv-pre-commit/bin/activate \
	  && pip install \
	    --upgrade \
	    pip \
	    setuptools \
	    wheel
	source .venv-pre-commit/bin/activate \
	  && pip install \
	    pre-commit
	source .venv-pre-commit/bin/activate \
	  && pre-commit install
	mkdir -p \
	  .venv-pre-commit/var
	touch $@


all-examples: \
  .dependencies.done.log
	$(MAKE) \
	  --directory examples

all-migration-0.2.0:
	$(MAKE) \
	  --directory releases/0.2.0/migration

all-ontology: \
  .dependencies.done.log
	$(MAKE) \
	  --directory ontology

check: \
  .venv-pre-commit/var/.pre-commit-built.log \
  check-examples \
  check-migration-0.2.0 \
  check-ontology

check-examples: \
  .dependencies.done.log
	$(MAKE) \
	  --directory examples \
	  check

check-migration-0.2.0:
	$(MAKE) \
	  --directory releases/0.2.0/migration \
	  check

check-ontology: \
  .dependencies.done.log
	$(MAKE) \
	  --directory ontology \
	  check

# This target's dependencies potentially modify the working directory's Git state, so it is intentionally not a dependency of check.
check-supply-chain: \
  check-supply-chain-pre-commit \
  check-supply-chain-submodules

check-supply-chain-pre-commit: \
  .venv-pre-commit/var/.pre-commit-built.log
	source .venv-pre-commit/bin/activate \
	  && pre-commit autoupdate
	git diff \
	  --exit-code \
	  .pre-commit-config.yaml

check-supply-chain-submodules: \
  .git_submodule_init.done.log
	git submodule update \
	  --remote
	git diff \
	  --exit-code \
	  --ignore-submodules=dirty \
	  dependencies

clean:
	@$(MAKE) \
	  --directory examples \
	  clean
	@$(MAKE) \
	  --directory ontology \
	  clean
	@rm -f \
	  .dependencies.done.log
	@$(MAKE) \
	  --directory dependencies \
	  clean
	@rm -f \
	  .venv.done.log
	@rm -rf \
	  venv
	@rm -f \
	  .git_submodule_init.done.log
	@$(MAKE) \
	  --directory releases/0.2.0/migration \
	  clean
