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

VIRTUALENV ?= $(shell which virtualenv-3 2>/dev/null || which virtualenv-3.8 2>/dev/null || which virtualenv-3.7 2>/dev/null || which virtualenv-3.6 2>/dev/null || which virtualenv)
ifeq ($(VIRTUALENV),)
$(error virtualenv not found)
endif

all: \
  all-examples \
  all-migration-0.2.0

all-examples: \
  .venv.done.log
	$(MAKE) \
	  --directory examples

all-migration-0.2.0:
	$(MAKE) \
	  --directory releases/0.2.0/migration

.PHONY: \
  all-examples \
  all-migration-0.2.0 \
  check-examples \
  check-migration-0.2.0

.venv.done.log: \
  requirements.txt
	rm -rf venv
	$(VIRTUALENV) \
	  --python=python3 \
	  venv
	source venv/bin/activate ; \
	  pip install \
	    --upgrade \
	    pip
	source venv/bin/activate ; \
	  pip install \
	    -r requirements.txt
	touch $@

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
