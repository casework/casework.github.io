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

# This Makefile is expected to be used with a Make 'include' directive
# when an example has a src/ directory, e.g. for inlining JSON snippets
# into the rendered documentation.  If there is no src/ directory, use
# example-nosrc.mk instead.

SHELL := /bin/bash

# Execution context - this Makefile is expected to be executed in the
# context of one of these directories:
# ${top_srcdir}/examples/${example}/
top_srcdir := $(shell cd ../.. ; pwd)

example_name := $(shell basename $$PWD)

# The last copy commands in this recipe risk overwriting edits if the
# user accidentally edited the file that was intended to be generated.
# A backup is made in a temporary directory if it looks like a
# destructive overwrite is about to occur.
all:
	$(MAKE) \
	  --directory src
	@diff \
	  src/generated-index.html \
	  index.html \
	  > /dev/null \
	  || git diff \
	    --exit-code \
	    index.html \
	    > /dev/null \
	    || ( \
	      export TMPDIR=$$(mktemp -d) \
	        && cat \
	          index.html \
	          > $$TMPDIR/index.html \
	          && echo "INFO:examples/$(example_name):Edits found in index.html, and about to be overwritten.  Stashing state in temporary file in case they were not meant to be overwritten.  Restore by running: 'mv $$TMPDIR/index.html index.html'." >&2 \
	    )
	@diff \
	  src/generated-$(example_name).json \
	  $(example_name).json \
	  > /dev/null \
	  || git diff \
	    --exit-code \
	    $(example_name).json \
	    > /dev/null \
	    || ( \
	      export TMPDIR=$$(mktemp -d) \
	        && cat \
	          $(example_name).json \
	          > $$TMPDIR/$(example_name).json \
	          && echo "INFO:examples/$(example_name):Edits found in $(example_name).json, and about to be overwritten.  Stashing state in temporary file in case they were not meant to be overwritten.  Restore by running: 'mv $$TMPDIR/$(example_name).json $(example_name).json'." >&2 \
	    )
	cp src/generated-index.html index.html
	cp src/generated-$(example_name).json $(example_name).json

# Generic tests:
# * Confirm the Git-committed version of the combined example JSON matches the file generated from the JSON pieces.
# * Confirm the Git-committed version of index.html matches the file generated from src/index.html.in and the JSON pieces.
check:
	$(MAKE) \
	  --directory src \
	  generated-index.html \
	  generated-$(example_name).json
	$(MAKE) \
	  --directory src \
	  check
	$(MAKE) \
	  --file ../src/example-nosrc.mk \
	  check
	diff \
	  src/generated-$(example_name).json \
	  $(example_name).json \
	  || (echo "UPDATE:examples/$(example_name)/Makefile:The generated $(example_name).json does not match the Git-tracked $(example_name).json.  If the above reported changes look fine, run 'cp src/generated-$(example_name).json $(example_name).json' to get a file ready to commit to Git." >&2 ; exit 1)
	diff \
	  src/generated-index.html \
	  index.html \
	  || (echo "UPDATE:examples/$(example_name)/Makefile:The generated index.html does not match the Git-tracked index.html.  If the above reported changes look fine, run 'cp src/generated-index.html index.html' to get a file ready to commit to Git." >&2 ; exit 1)

clean:
	@$(MAKE) \
	  --file ../src/example-nosrc.mk \
	  clean
	@$(MAKE) \
	  --directory src \
	  clean
