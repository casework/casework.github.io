#!/usr/bin/make -f

# Portions of this file contributed by NIST are governed by the
# following statement:
#
# This software was developed at the National Institute of Standards
# and Technology by employees of the Federal Government in the course
# of their official duties. Pursuant to Title 17 Section 105 of the
# United States Code, this software is not subject to copyright
# protection within the United States. NIST assumes no responsibility
# whatsoever for its use by other parties, and makes no guarantees,
# expressed or implied, about its quality, reliability, or any other
# characteristic.
#
# We would appreciate acknowledgement if the software is used.

# Implementation note:
# During exploratory development, this Makefile does not yet fit the
# workflow of the other examples, mainly because other example graphs
# are needed to review queries.

SHELL := /bin/bash

top_srcdir := $(shell cd ../.. ; pwd)

RDF_TOOLKIT_JAR := $(top_srcdir)/dependencies/CASE-develop/dependencies/UCO/lib/rdf-toolkit.jar

all: \
  query-email_addresses_in_common.html

.drafting.ttl.validates.log: \
  $(top_srcdir)/.venv.done.log \
  drafting.ttl
	source $(top_srcdir)/venv/bin/activate \
	  && case_validate \
	    --abort \
	    --inference none \
	    --metashacl \
	    --review-tbox \
	    drafting.ttl
	touch $@

check: \
  all

clean:
	@rm -f \
	  .drafting.ttl.validates.log \
	  *validation*.ttl

crossover_linked_validation.ttl: \
  $(RDF_TOOLKIT_JAR) \
  ../crossover_heist/crossover_heist.json \
  ../crossover_wmd/crossover_wmd.json \
  .drafting.ttl.validates.log \
  crossover_linked.json
	rm -f __$@ _$@
	source $(top_srcdir)/venv/bin/activate \
	  && case_validate \
	    --abort \
	    --allow-infos \
	    --format turtle \
	    --inference none \
	    --ontology-graph drafting.ttl \
	    --output __$@ \
	    ../crossover_heist/crossover_heist.json \
	    ../crossover_wmd/crossover_wmd.json \
	    crossover_linked.json
	test -s __$@
	java -jar $(RDF_TOOLKIT_JAR) \
	  --inline-blank-nodes \
	  --source __$@ \
	  --source-format turtle \
	  --target _$@ \
	  --target-format turtle
	rm __$@
	mv _$@ $@

query-email_addresses_in_common.html: \
  crossover_linked_validation.ttl \
  query-email_addresses_in_common.sparql
	rm -f _$@
	source $(top_srcdir)/venv/bin/activate \
	  && case_sparql_select \
	    --no-index \
	    --use-prefixes \
	    _$@ \
	    query-email_addresses_in_common.sparql \
	    drafting.ttl \
	    ../crossover_heist/crossover_heist.json \
	    ../crossover_wmd/crossover_wmd.json \
	    crossover_linked.json
	mv _$@ $@
