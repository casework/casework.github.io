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

example_name := $(shell cd .. ; basename $$PWD)

example_snippets_json := $(wildcard $(example_name)-*.json)
query_sparql_files := $(wildcard query-*.sparql)
query_md_files := $(foreach query_sparql_file,$(query_sparql_files),$(subst .sparql,.md,$(query_sparql_file)))

generated_readme_sed_sources := \
  $(example_snippets_json) \
  $(query_md_files) \
  $(query_sparql_files)

all: \
  generated-README.md \
  generated-$(example_name).json

.PHONY: \
  normalize \
  check-validation

check: \
  check-validation

#TODO - This process will be defined after the release of CASE 0.5.0.
check-validation:

clean:
	@rm -f \
	  *.sed \
	  .normalized-* \
	  generated-* \
	  query-*.md

generated-README.md: \
  README.md.in \
  generated-README.sed
	sed -f generated-README.sed README.md.in > _$@
	mv _$@ $@

generated-README.sed: \
  $(example_name)_base.json \
  $(generated_readme_sed_sources)
	for x in $^ ; do \
          echo "/@$$(echo $${x} | tr '[:lower:]' '[:upper:]' | tr . _ | tr - _)@/r $${x}" ; \
          echo "/@$$(echo $${x} | tr '[:lower:]' '[:upper:]' | tr . _ | tr - _)@/d" ; \
	done >> _$@
	mv _$@ $@

generated-$(example_name).json: \
  $(example_name)_json.py \
  $(example_name)_base.json \
  $(example_snippets_json)
	python3 $(example_name)_json.py \
	  $(example_name)_base.json \
	  $(example_snippets_json) \
	  > _$@
	mv _$@ $@

normalize:
	ls $(example_name)-*.json \
	  | while read x; do python3 -m json.tool $$x .normalized-$$x && mv .normalized-$$x $$x ; done

query-%.md: \
  query-%.sparql \
  $(top_srcdir)/.venv.done.log \
  ../drafting.ttl \
  generated-$(example_name).json
	source $(top_srcdir)/venv/bin/activate \
	  && case_sparql_select \
	    _$@ \
	    $< \
	    ../drafting.ttl \
	    generated-$(example_name).json
	mv _$@ $@
