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

top_srcdir := $(shell cd .. ; pwd)

case_turtle_files := $(shell /bin/ls CASE/ontology/*/*.ttl)
uco_turtle_files := $(shell /bin/ls CASE/dependencies/UCO/uco-*/*.ttl)

all: \
  case_monolithic.ttl

case_monolithic.ttl: \
  $(case_turtle_files) \
  $(top_srcdir)/.venv.done.log \
  $(uco_turtle_files) \
  CASE/dependencies/UCO/tests/src/glom_graph.py
	source $(top_srcdir)/venv/bin/activate \
	  && python3 CASE/dependencies/UCO/tests/src/glom_graph.py \
	    _$@ \
	    $(case_turtle_files) \
	    $(uco_turtle_files)
	mv _$@ $@

# This recipe intentionally left blank.
check:

clean:
	@rm -f \
	  case_monolithic.ttl
