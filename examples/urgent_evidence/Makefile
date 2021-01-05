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

top_srcdir := $(shell cd ../.. ; pwd)

all: \
  index.html

# The unit test of this directory is:
# Confirm that the generated, and website-served, index.html page is exactly what is tracked in version control after regenerating.
# The .diff files should not be retained.  If any are found after calling 'make check', they illustrate a problem.
check: \
  index.html.diff
	test -e index.html.diff
	test ! -s index.html.diff \
	  || (echo "ERROR:examples/urgent_evidence/Makefile:The file index.html is out of sync with its source files, index.html.in, urgent_evidence.json, and/or the .sparql files.  Please regenerate index.html by running 'make' and committing the update." >&2 ; exit 1)
	rm *.diff
	source $(top_srcdir)/venv/bin/activate \
	  && pytest

clean:
	@rm -f *.diff
	@touch urgent_evidence.json

index.html: \
  index.html.in \
  urgent_evidence-query-action_timeline.html \
  urgent_evidence-query-exhibit_photos.html \
  urgent_evidence-query-investigative_locations.html \
  urgent_evidence-query-investigative_personae.html
	cp \
	  index.html.in \
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
	sed \
	  -e '/@QUERY_INVESTIGATIVE_LOCATIONS_SPARQL@/r urgent_evidence-query-investigative_locations.sparql' \
	  -e '/@QUERY_INVESTIGATIVE_LOCATIONS_SPARQL@/d' \
	  _$@ \
	  > __$@
	mv __$@ _$@
	sed \
	  -e '/@QUERY_INVESTIGATIVE_LOCATIONS_HTML@/r urgent_evidence-query-investigative_locations.html' \
	  -e '/@QUERY_INVESTIGATIVE_LOCATIONS_HTML@/d' \
	  _$@ \
	  > __$@
	mv __$@ _$@
	sed \
	  -e '/@QUERY_INVESTIGATIVE_PERSONAE_SPARQL@/r urgent_evidence-query-investigative_personae.sparql' \
	  -e '/@QUERY_INVESTIGATIVE_PERSONAE_SPARQL@/d' \
	  _$@ \
	  > __$@
	mv __$@ _$@
	sed \
	  -e '/@QUERY_INVESTIGATIVE_PERSONAE_HTML@/r urgent_evidence-query-investigative_personae.html' \
	  -e '/@QUERY_INVESTIGATIVE_PERSONAE_HTML@/d' \
	  _$@ \
	  > __$@
	mv __$@ _$@
	sed \
	  -e '/@QUERY_EXHIBIT_PHOTOS_SPARQL@/r urgent_evidence-query-exhibit_photos.sparql' \
	  -e '/@QUERY_EXHIBIT_PHOTOS_SPARQL@/d' \
	  _$@ \
	  > __$@
	mv __$@ _$@
	sed \
	  -e '/@QUERY_EXHIBIT_PHOTOS_HTML@/r urgent_evidence-query-exhibit_photos.html' \
	  -e '/@QUERY_EXHIBIT_PHOTOS_HTML@/d' \
	  _$@ \
	  > __$@
	mv __$@ _$@
	mv _$@ $@

index.html.diff: \
  index.html
	test 1 -eq $$(git ls-tree HEAD index.html | wc -l)  # Confirm file is git-tracked.
	git diff index.html > _$@
	mv _$@ $@

urgent_evidence-query-%.html: \
  urgent_evidence-query-%.sparql \
  $(top_srcdir)/.venv.done.log \
  $(top_srcdir)/src/sample_sparql_runner.py \
  urgent_evidence.json
	source $(top_srcdir)/venv/bin/activate ; \
	  python3 $(top_srcdir)/src/sample_sparql_runner.py \
	    urgent_evidence.json \
	    $< \
	    _$@
	mv _$@ $@
