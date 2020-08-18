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

PYTHON3 ?= $(shell which python3)

all: \
  asgard.json \
  index.html

asgard.json: \
  asgard_json.py \
  asgard_0.json \
  asgard_1.json \
  asgard_2.json \
  asgard_3.json \
  asgard_4.json \
  asgard_5.json
	rm -f __$@ _$@
	$(PYTHON3) $^ > __$@
	$(PYTHON3) -m json.tool __$@ > _$@
	rm __$@
	mv _$@ $@

# Tests:
# * Confirm JSON portions of example are not changed when run through json.tool.
check:
	diff asgard_0.json <($(PYTHON3) -m json.tool asgard_0.json)
	diff asgard_1.json <($(PYTHON3) -m json.tool asgard_1.json)
	diff asgard_2.json <($(PYTHON3) -m json.tool asgard_2.json)
	diff asgard_3.json <($(PYTHON3) -m json.tool asgard_3.json)
	diff asgard_4.json <($(PYTHON3) -m json.tool asgard_4.json)
	diff asgard_5.json <($(PYTHON3) -m json.tool asgard_5.json)

clean:
	@rm -f \
	  asgard.json \
	  index.html

# Using example from the documentation-generating Makefile at:
# https://github.com/usnistgov/swid-autotools
index.html: \
  index.html.in \
  asgard_0.json \
  asgard_1.json \
  asgard_2.json \
  asgard_3.json \
  asgard_4.json \
  asgard_5.json
	rm -f $@_ $@__
	cp index.html.in $@_
	sed \
	  -e '/@ASGARD_0__JSON@/r asgard_0.json' \
	  -e '/@ASGARD_0__JSON@/d' \
	  $@_ \
	  > $@__
	mv $@__ $@_
	sed \
	  -e '/@ASGARD_1__JSON@/r asgard_1.json' \
	  -e '/@ASGARD_1__JSON@/d' \
	  $@_ \
	  > $@__
	mv $@__ $@_
	sed \
	  -e '/@ASGARD_2__JSON@/r asgard_2.json' \
	  -e '/@ASGARD_2__JSON@/d' \
	  $@_ \
	  > $@__
	mv $@__ $@_
	sed \
	  -e '/@ASGARD_3__JSON@/r asgard_3.json' \
	  -e '/@ASGARD_3__JSON@/d' \
	  $@_ \
	  > $@__
	mv $@__ $@_
	sed \
	  -e '/@ASGARD_4__JSON@/r asgard_4.json' \
	  -e '/@ASGARD_4__JSON@/d' \
	  $@_ \
	  > $@__
	mv $@__ $@_
	sed \
	  -e '/@ASGARD_5__JSON@/r asgard_5.json' \
	  -e '/@ASGARD_5__JSON@/d' \
	  $@_ \
	  > $@__
	mv $@__ $@_
	mv $@_ $@
