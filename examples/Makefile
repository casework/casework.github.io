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

# Set up descending into each directory that has a Makefile.
example_dirs := $(shell ls */Makefile | xargs dirname)

all_targets   := $(foreach example_dir,$(example_dirs),all-$(example_dir))
check_targets := $(foreach example_dir,$(example_dirs),check-$(example_dir))
clean_targets := $(foreach example_dir,$(example_dirs),clean-$(example_dir))

all: \
  $(all_targets)

all-%: \
  %/Makefile
	$(MAKE) \
	  --directory $$(dirname $<)

check: \
  $(check_targets)

check-%: \
  %/Makefile
	$(MAKE) \
	  --directory $$(dirname $<) \
	  check

clean: \
  $(clean_targets)

clean-%: \
  %/Makefile
	@$(MAKE) \
	  --directory $$(dirname $<) \
	  clean
