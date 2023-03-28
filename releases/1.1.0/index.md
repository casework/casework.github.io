---
title: 1.1.0 Release
layout: releases
custom_css: releases
---

# {{ page.title }}

*Date: 2022-11-22*


## Ontology File(s)

[GitHub](https://github.com/casework/CASE/releases/tag/1.1.0)


## Release Notes

CASE 1.1.0 incorporates required refinements and updates, building on the stable 1.0.0 release.  Following [SemVer](https://semver.org/spec/v2.0.0.html), additive improvements will continue to be accepted, but backwards-incompatible changes will be scheduled only for the 2.0.0 release, which will come after at least 6 months to possibly 12 months.

This release adopts [UCO 1.1.0](https://unifiedcyberontology.org/releases/1.1.0/), incorporating bugfixes and test improvements from UCO 1.1.0.


### Focus


#### Breaking Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology that make the new release non-backward-compatible.)*


#### Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology.)*

* Added a typo checker to upstream design vocabularies ([*GitHub Issue 119*](https://github.com/casework/CASE/issues/119))
* Expanded CI trigger-branches to include multiple develops and unstables ([*UCO GitHub Issue 493*](https://github.com/ucoProject/UCO/issues/493))
* Integrated a SHACL conformance checking system into CI ([*UCO GitHub Issue 504*](https://github.com/ucoProject/UCO/issues/504))

#### Bug Fixes

*(These are bugs found within the preexisting ontology that have been fixed.)*

* Removed the errant concept of owl:ontologyIRI ([*UCO GitHub Issue 491*](https://github.com/ucoProject/UCO/issues/491))

## Documentation

Generated documentation is available at this site:

[https://ontology.caseontology.org/](https://ontology.caseontology.org/)

Be aware that the documentation at that site will only show the most recent release.  The upper-left corner of the documentation pages shows the ontology version being reviewed.

Users interested in seeing the rendered documentation at this version "Back in time" should locally clone the ontology documentation repository, checking out [this branch](https://github.com/casework/ontology.caseontology.org/tree/archive/release-1.1.0), and follow the deployment directions in `CONTRIBUTE.md`.
