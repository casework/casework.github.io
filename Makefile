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
PYTHON3 ?= $(shell which python3.8 2>/dev/null || which python3.7 2>/dev/null || which python3.6 2>dev/null || which python3 2>/dev/null)
ifeq ($(PYTHON3),)
$(error python3 not found)
endif

all: \
  all-examples \
  all-migration-0.2.0

.PHONY: \
  all-examples \
  all-migration-0.2.0 \
  check-examples \
  check-migration-0.2.0

.venv.done.log: \
  requirements.txt
	rm -rf venv
	$(PYTHON3) -m virtualenv \
	  --python=$(PYTHON3) \
	  venv
	source venv/bin/activate ; \
	  pip install \
	    --upgrade \
	    pip
	source venv/bin/activate ; \
	  pip install \
	    -r requirements.txt
	touch $@

all-examples: \
  .venv.done.log
	$(MAKE) \
	  --directory examples

all-migration-0.2.0:
	$(MAKE) \
	  --directory releases/0.2.0/migration

check: \
  check-examples \
  check-migration-0.2.0

check-examples: \
  .venv.done.log
	$(MAKE) \
	  --directory examples \
	  check

check-migration-0.2.0:
	$(MAKE) \
	  --directory releases/0.2.0/migration \
	  check

clean:
	@rm -f \
	  .venv.done.log
	@rm -rf \
	  venv
	@$(MAKE) \
	  --directory examples \
	  clean
	@$(MAKE) \
	  --directory releases/0.2.0/migration \
	  clean
	@$(MAKE) \
	  --directory examples \
	  clean
