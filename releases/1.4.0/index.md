---
title: 1.4.0 Release
layout: releases
custom_css: releases
---

# {{ page.title }}

*Date: 2025-05-29*


## Ontology File(s)


## Release Notes

CASE 1.4.0 incorporates required refinements and updates, building on the stable 1.0.0 release.  Following [SemVer](https://semver.org/spec/v2.0.0.html), additive improvements will continue to be accepted, but backwards-incompatible changes will be scheduled only for the 2.0.0 release, which will come after at least 6 months to possibly 12 months.

This release adopts [UCO 1.4.0](https://unifiedcyberontology.org/releases/1.4.0/), incorporating bugfixes and test improvements from UCO 1.4.0.

CASE users who see warnings arise pertaining to semi-open vocabulary literals, such as those used in `uco-types:Hash` objects, should refer to the [UCO 1.4.0 release notes]((https://unifiedcyberontology.org/releases/1.4.0/) section "Semi-open vocabulary syntax change."

With the adoption of UCO 1.4.0, `case-investigation:ProvenanceRecord`s may now contain no members.  This can be used for `case-investigation:InvestigativeAction`s that turn out to have no results aside from a `ProvenanceRecord`.


### Focus


#### Breaking Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology that make the new release non-backward-compatible.)*


#### Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology.)*

* Linked `core:informalType` as parent of type-describing properties ([*UCO GitHub Issue 640*](https://github.com/ucoProject/UCO/issues/640))
* Removed 1-member minimum on `core:ContextualCompilation` ([*UCO GitHub Issue 599*](https://github.com/ucoProject/UCO/issues/599)), which is the parent class of `case-investigation:ProvenanceRecord`


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
