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
# The .diff files should not be retained.  If any are found after calling 'make check', they illustrate a problem.
check: \
  urgent_evidence.html.diff
	test -e urgent_evidence.html.diff
	test ! -s urgent_evidence.html.diff
	rm *.diff

clean:
	@rm -f *.diff
	@touch urgent_evidence.json

urgent_evidence.html: \
  urgent_evidence.html.in \
  urgent_evidence-query-action_timeline.html
	cp \
	  urgent_evidence.html.in \
	  _$@
	sed \
	  -e '/@QUERY_ACTION_TIMELINE_SPARQL@/r urgent_evidence-query-action_timeline.sparql' \
	  -e '/@QUERY_ACTION_TIMELINE_SPARQL@/d' \
	  _$@ \
	  > __$@
	mv __$@ _$@
	sed \
	  -e '/@QUERY_ACTION_TIMELINE_HTML@/r urgent_evidence-query-action_timeline.html' \
	  -e '/@QUERY_ACTION_TIMELINE_HTML@/d' \
	  _$@ \
	  > __$@
	mv __$@ _$@
	mv _$@ $@

urgent_evidence.html.diff: \
  urgent_evidence.html
	test 1 -eq $$(git ls-tree HEAD urgent_evidence.html | wc -l)  # Confirm file is git-tracked.
	git diff urgent_evidence.html > _$@
	mv _$@ $@

urgent_evidence-query-%.html: \
  urgent_evidence-query-%.sparql \
  $(top_srcdir)/.venv.done.log \
  $(top_srcdir)/src/sample_sparql_runner.py \
  urgent_evidence.json
	source $(top_srcdir)/venv/bin/activate ; \
	  python3 $(top_srcdir)/src/sample_sparql_runner.py \
	    --debug \
	    urgent_evidence.json \
	    $< \
	    _$@
	mv _$@ $@
