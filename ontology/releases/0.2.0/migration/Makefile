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

top_srcdir := $(shell cd ../../../.. ; pwd)

all: \
  classes_ambiguous.csv \
  classes.csv \
  kindOfRelationship_enumerants.csv \
  properties_ambiguous.csv \
  properties.csv

.PRECIOUS: \
  %.csv \
  %.tsv

%.csv: \
  %.tsv
	cat $< \
	  | tr '\t' ',' \
	    > _$@
	mv _$@ $@

%.diff: \
  %.tsv
	diff \
	  $< \
	  $(top_srcdir)/_data/ontology/migration_0_2_0/$< \
	  > _$@
	mv _$@ $@

%.tsv: \
  $(top_srcdir)/_data/ontology/migration_0_2_0/%.tsv
	cp $< _$@
	mv _$@ $@

# The unit test of this directory is:
# Confirm that the TSV files in this directory match the files used to power the Jekyll-generated page.
# The .diff files should not need be retained.  If any are found after calling 'make check', they report a problem.
check: \
  classes_ambiguous.diff \
  classes.diff \
  kindOfRelationship_enumerants.diff \
  properties_ambiguous.diff \
  properties.diff
	rm *.diff

clean:
	@rm -f *.csv *.diff *.tsv
