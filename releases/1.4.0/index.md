---
title: 1.4.0 Release
layout: releases
custom_css: releases
---

# {{ page.title }}

*Date: 2025-05-29*


## Ontology File(s)


## Release Notes


### Focus


#### Breaking Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology that make the new release non-backward-compatible.)*


#### Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology.)*

* Linked `core:informalType` as parent of type-describing properties ([*UCO GitHub Issue 640*](https://github.com/ucoProject/UCO/issues/640))


#### Bug Fixes

*(These are bugs found within the preexisting ontology that have been fixed.)*

* Removed `owl:onDatatype` from vocabulary definitions ([*UCO GitHub Issue 593*](https://github.com/ucoProject/UCO/issues/593))
* Revised vocabulary pattern ([*UCO GitHub Issue 629*](https://github.com/ucoProject/UCO/issues/629))
* Adjusted top Makefile dependency ordering in submodule initialization ([*CASE GitHub Issue 167*](https://github.com/casework/CASE/issues/167))


## Documentation

Generated documentation is available at this site:

[https://ontology.caseontology.org/](https://ontology.caseontology.org/)

Be aware that the documentation at that site will only show the most recent release.  The upper-left corner of the documentation pages shows the ontology version being reviewed.

Users interested in seeing the rendered documentation at this version "Back in time" should locally clone the ontology documentation repository, checking out [this branch](https://github.com/casework/ontology.caseontology.org/tree/archive/release-1.4.0), and follow the deployment directions in `CONTRIBUTE.md`.
