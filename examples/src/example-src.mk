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
# ${top_srcdir}/examples/${example}/src/
top_srcdir := $(shell cd ../../.. ; pwd)

examples_srcdir := $(top_srcdir)/examples

example_name := $(shell cd .. ; basename $$PWD)

# Use wildcard to "Optionally" depend on drafting.ttl, which is only
# expected to be present when concepts under draft are in use.
drafting_ttl := $(wildcard ../drafting.ttl)

# Guarantee sort order of snippets when glomming into single file.
example_snippets_json := \
  $(shell find * -maxdepth 0 -name '$(example_name)-*.json' | LC_ALL=C sort)

normalized_example_snippets_json := \
  $(foreach example_snippet_json,$(example_snippets_json),normalized-$(example_snippet_json))
check_normalized_example_snippets_json := \
  check-normalized-$(example_name)_base.json \
  $(foreach normalized_example_snippet_json,$(normalized_example_snippets_json),check-$(normalized_example_snippet_json))

query_sparql_files := $(wildcard query-*.sparql)
query_html_files := $(foreach query_sparql_file,$(query_sparql_files),$(subst .sparql,.html,$(query_sparql_file)))
query_md_files := $(foreach query_sparql_file,$(query_sparql_files),$(subst .sparql,.md,$(query_sparql_file)))

shared_query_sparql_files := $(wildcard $(examples_srcdir)/src/query-*.sparql)

generated_local_index_sed_sources := \
  $(example_snippets_json) \
  $(query_html_files) \
  $(query_md_files) \
  $(query_sparql_files)

all: \
  generated-index.html \
  generated-$(example_name).json

.PHONY: \
  check-normalized-%.json \
  check-pytest \
  check-validation

.PRECIOUS: \
  normalized-%.json

check: \
  $(check_normalized_example_snippets_json) \
  check-pytest \
  check-validation \
  generated-index.html \
  generated-$(example_name).json

# Generic test:
# * Confirm JSON portions of example are not changed when normalized with json.tool.
check-normalized-%.json: \
  %.json \
  normalized-%.json
	@diff $^ >/dev/null \
	  || echo "ERROR:JSON snippet not normalized: $<." >&2
	diff $^

# Run pytest tests only if any are written.
# (Pytest exits in an error state if called with no tests found.)
check-pytest: \
  generated-$(example_name)-wasInformedBy.json
	test 0 -eq $$(/bin/ls *_test.py test_*.py 2>/dev/null | wc -l) \
	  || ( \
	    source $(top_srcdir)/venv/bin/activate \
	      && pytest \
	        --log-level=DEBUG \
	  )

#TODO - This process will be defined after the release of CASE 0.5.0.
check-validation:

clean:
	@rm -f \
	  *.sed \
	  generated-* \
	  normalized-* \
	  query-*.md

generated-index.html: \
  index.html.in \
  generated-index.sed
	sed -f generated-index.sed index.html.in > _$@
	mv _$@ $@

# Using example from the documentation-generating Makefile at:
# https://github.com/usnistgov/swid-autotools
generated-index.sed: \
  $(example_name)_base.json \
  $(generated_local_index_sed_sources) \
  $(shared_query_sparql_files)
	for x in $(example_name)_base.json $(generated_local_index_sed_sources) ; do \
          echo "/@$$(echo $${x} | tr '[:lower:]' '[:upper:]' | tr . _ | tr - _)@/r $${x}" ; \
          echo "/@$$(echo $${x} | tr '[:lower:]' '[:upper:]' | tr . _ | tr - _)@/d" ; \
	done >> _$@
	for x in $(shared_query_sparql_files) ; do \
          echo "/@$$(basename $${x} | tr '[:lower:]' '[:upper:]' | tr . _ | tr - _)@/r $${x}" ; \
          echo "/@$$(basename $${x} | tr '[:lower:]' '[:upper:]' | tr . _ | tr - _)@/d" ; \
	done >> _$@
	mv _$@ $@

generated-$(example_name).json: \
  $(example_name)_base.json \
  $(example_name)_json.py \
  $(example_snippets_json)
	python3 $(example_name)_json.py \
	  $(example_name)_base.json \
	  $(example_snippets_json) \
	  > __$@
	@#Use same normalization procedure when constructing generated file.
	python3 -m json.tool \
	  __$@ \
	  _$@
	rm __$@
	mv _$@ $@

# Not all examples will require the chain of communication, but some do.
# It is currently considered acceptable cost to derive this chain for
# all examples.
generated-$(example_name)-wasInformedBy.json: \
  $(examples_srcdir)/src/query-construct-wasInformedBy.sparql \
  $(top_srcdir)/.venv.done.log \
  generated-$(example_name).json
	source $(top_srcdir)/venv/bin/activate \
	  && case_sparql_construct \
	    _$@ \
	    $< \
	    generated-$(example_name).json
	mv _$@ $@

normalized-%.json: \
  %.json
	python3 -m json.tool \
	  $< \
	  _$@
	mv _$@ $@

query-%.html: \
  query-%.sparql \
  $(drafting_ttl) \
  generated-$(example_name).json \
  generated-$(example_name)-wasInformedBy.json
	source $(top_srcdir)/venv/bin/activate \
	  && case_sparql_select \
	    --disallow-empty-results \
	    _$@ \
	    $< \
	    generated-$(example_name).json \
	    generated-$(example_name)-wasInformedBy.json \
	    $(drafting_ttl)
	mv _$@ $@

query-%.md: \
  query-%.sparql \
  $(drafting_ttl) \
  generated-$(example_name).json \
  generated-$(example_name)-wasInformedBy.json
	source $(top_srcdir)/venv/bin/activate \
	  && case_sparql_select \
	    --disallow-empty-results \
	    _$@ \
	    $< \
	    generated-$(example_name).json \
	    generated-$(example_name)-wasInformedBy.json \
	    $(drafting_ttl)
	mv _$@ $@
