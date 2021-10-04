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

# Execution context - this Makefile is expected to be executed in the
# context of one of these directories:
# ${top_srcdir}/examples/${example}/
top_srcdir := $(shell cd ../.. ; pwd)

example_name := $(shell basename $$PWD)

all:
	$(MAKE) \
	  --directory src \
	  --file ../src/example-src.mk
	cp src/generated-index.html index.html
	cp src/generated-$(example_name).json $(example_name).json

check:
	$(MAKE) \
	  --directory src \
	  --file ../src/example-src.mk \
	  check \
	  generated-index.html \
	  generated-$(example_name).json
	diff \
	  src/generated-$(example_name).json \
	  $(example_name).json \
	  || (echo "UPDATE:examples/$(example_name):The generated $(example_name).json does not match the Git-tracked $(example_name).json.  If the above reported changes look fine, run 'cp src/generated-$(example_name).json $(example_name).json' to get a file ready to commit to Git." >&2 ; exit 1)
	diff \
	  src/generated-index.html \
	  index.html \
	  || (echo "UPDATE:examples/$(example_name):The generated index.html does not match the Git-tracked index.html.  If the above reported changes look fine, run 'cp src/generated-index.html index.html' to get a file ready to commit to Git." >&2 ; exit 1)

clean:
	@$(MAKE) \
	  --directory src \
	  --file ../src/example-src.mk \
	  clean
