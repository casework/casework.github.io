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

top_srcdir := $(shell cd ../../.. ; pwd)

all: \
  urgent_evidence.html

# The unit test of this directory is:
# Confirm that the generated, and website-served, urgent_evidence.html page is exactly what is tracked in version control after regenerating.
# The .diff files should not need be retained.  If any are found after calling 'make check', they report a problem.
check: \
  urgent_evidence.html.diff
	test -e urgent_evidence.html.diff
	test ! -s urgent_evidence.html.diff
	rm *.diff

clean:
	@rm *.diff
	@touch urgent_evidence.json

urgent_evidence.html: \
  urgent_evidence.json
	touch $@

urgent_evidence.html.diff: \
  urgent_evidence.html
	test 1 -eq $$(git ls-tree HEAD urgent_evidence.html | wc -l)  # Confirm file is git-tracked.
	git diff urgent_evidence.html > _$@
	mv _$@ $@
