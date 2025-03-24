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

# This Makefile handles building and review of nightly ontology builds
# in syntax-normalized form.  This construction is separate from the
# monolithic builds in the /dependencies directory for a few reasons:
# * Normalization at the time of this writing takes some time to run,
#   and doesn't necessarily need to impact other tests that need a
#   monolithic build without regard for whether its syntax is
#   normalized.
# * The /dependencies directory is set up to not be served as a website
#   resource.

SHELL := /bin/bash

top_srcdir := $(shell cd .. ; pwd)

RDF_TOOLKIT_JAR := $(top_srcdir)/dependencies/CASE-develop/dependencies/UCO/lib/rdf-toolkit.jar

all: \
  CASE-develop.ttl \
  CASE-develop-2.0.0.ttl \
  CASE-unstable.ttl \
  CASE-unstable-2.0.0.ttl

.PHONY: \
  check-develop \
  check-unstable \
  get-started-resources

CASE-develop.ttl: \
  $(top_srcdir)/dependencies/CASE-develop.ttl \
  $(RDF_TOOLKIT_JAR)
	java -jar $(RDF_TOOLKIT_JAR) \
	  --inline-blank-nodes \
	  --source $< \
	  --source-format turtle \
	  --target _$@ \
	  --target-format turtle
	mv _$@ $@

CASE-develop-2.0.0.ttl: \
  $(top_srcdir)/dependencies/CASE-develop-2.0.0.ttl \
  $(RDF_TOOLKIT_JAR)
	java -jar $(RDF_TOOLKIT_JAR) \
	  --inline-blank-nodes \
	  --source $< \
	  --source-format turtle \
	  --target _$@ \
	  --target-format turtle
	mv _$@ $@

CASE-unstable.ttl: \
  $(top_srcdir)/dependencies/CASE-unstable.ttl \
  $(RDF_TOOLKIT_JAR)
	java -jar $(RDF_TOOLKIT_JAR) \
	  --inline-blank-nodes \
	  --source $< \
	  --source-format turtle \
	  --target _$@ \
	  --target-format turtle
	mv _$@ $@

CASE-unstable-2.0.0.ttl: \
  $(top_srcdir)/dependencies/CASE-unstable-2.0.0.ttl \
  $(RDF_TOOLKIT_JAR)
	java -jar $(RDF_TOOLKIT_JAR) \
	  --inline-blank-nodes \
	  --source $< \
	  --source-format turtle \
	  --target _$@ \
	  --target-format turtle
	mv _$@ $@

check: \
  check-develop \
  check-unstable \
  check-unstable-2.0.0 \
  get-started-resources

check-develop: \
  CASE-develop.ttl
	git diff \
	  --exit-code \
	  $< \
	  || (echo "ERROR:ontology/Makefile:Generated version of $< does not match Git-tracked state.  Please review and commit $<." ; exit 1)

check-unstable: \
  CASE-unstable.ttl
	git diff \
	  --exit-code \
	  $< \
	  || (echo "ERROR:ontology/Makefile:Generated version of $< does not match Git-tracked state.  Please review and commit $<." ; exit 1)

check-unstable-2.0.0: \
  CASE-unstable-2.0.0.ttl
	git diff \
	  --exit-code \
	  $< \
	  || (echo "ERROR:ontology/Makefile:Generated version of $< does not match Git-tracked state.  Please review and commit $<." ; exit 1)

clean:
	@rm -f \
	  CASE-develop*.ttl \
	  CASE-unstable*.ttl \
	  get-started-example-*.md \
	  get-started-example-*.nt \
	  get-started-example-*.rdf \
	  get-started-example-*.ttl

# This target generates some of the result snippets that were manually
# copied into get-started.md.  "make check" depends on this to confirm
# the examples will rebuild.
get-started-resources: \
  get-started-example-minimal.nt \
  get-started-example-minimal.rdf \
  get-started-example-minimal.ttl \
  get-started-example-location.nt \
  get-started-example-location.rdf \
  get-started-example-location.ttl \
  get-started-example-location.md

get-started-example-location.md: \
  $(top_srcdir)/.venv.done.log \
  get-started-example-location.jsonld \
  get-started-example-location-query.sparql
	source $(top_srcdir)/venv/bin/activate \
	  && case_sparql_select \
	    _$@ \
	    get-started-example-location-query.sparql \
	    get-started-example-location.jsonld
	mv _$@ $@

get-started-example-location.nt: \
  get-started-example-location.jsonld \
  $(top_srcdir)/.venv.done.log
	source $(top_srcdir)/venv/bin/activate \
	  && rdfpipe \
	    --output-format nt \
	    $< \
	    > __$@
	LC_ALL=C \
	  sort \
	    __$@ \
	    > _$@
	rm __$@
	mv _$@ $@

get-started-example-location.rdf: \
  get-started-example-location.jsonld \
  $(top_srcdir)/.venv.done.log
	source $(top_srcdir)/venv/bin/activate \
	  && rdfpipe \
	    --output-format xml \
	    $< \
	    > _$@
	mv _$@ $@

get-started-example-location.ttl: \
  get-started-example-location.jsonld \
  $(top_srcdir)/.venv.done.log
	source $(top_srcdir)/venv/bin/activate \
	  && rdfpipe \
	    --output-format turtle \
	    $< \
	    > _$@
	mv _$@ $@

get-started-example-minimal.nt: \
  get-started-example-minimal.jsonld \
  $(top_srcdir)/.venv.done.log
	source $(top_srcdir)/venv/bin/activate \
	  && rdfpipe \
	    --output-format nt \
	    $< \
	    > __$@
	LC_ALL=C \
	  sort \
	    __$@ \
	    > _$@
	rm __$@
	mv _$@ $@

get-started-example-minimal.rdf: \
  get-started-example-minimal.jsonld \
  $(top_srcdir)/.venv.done.log
	source $(top_srcdir)/venv/bin/activate \
	  && rdfpipe \
	    --output-format xml \
	    $< \
	    > _$@
	mv _$@ $@

get-started-example-minimal.ttl: \
  get-started-example-minimal.jsonld \
  $(top_srcdir)/.venv.done.log
	source $(top_srcdir)/venv/bin/activate \
	  && rdfpipe \
	    --output-format turtle \
	    $< \
	    > _$@
	mv _$@ $@
