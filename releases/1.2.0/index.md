---
title: 1.2.0 Release
layout: releases
custom_css: releases
---

# {{ page.title }}

*Date: 2023-03-29*


## Ontology File(s)

[GitHub](https://github.com/casework/CASE/releases/tag/1.2.0)


## Release Notes

CASE 1.2.0 incorporates required refinements and updates, building on the stable 1.0.0 release.  Following [SemVer](https://semver.org/spec/v2.0.0.html), additive improvements will continue to be accepted, but backwards-incompatible changes will be scheduled only for the 2.0.0 release, which will come after at least 6 months to possibly 12 months.

This release adopts [UCO 1.2.0](https://unifiedcyberontology.org/releases/1.2.0/), incorporating bugfixes and test improvements from UCO 1.2.0.  A new feature incorporates construction of support for offline development with some ontology tools that require local-file substitution for imported IRIs.


### Focus


#### Breaking Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology that make the new release non-backward-compatible.)*

This release contains no breaking changes scoped to CASE.


#### Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology.)*

* Added support for Protégé ([*UCO GitHub Issue 449*](https://github.com/ucoProject/UCO/issues/449))


#### Bug Fixes

*(These are bugs found within the preexisting ontology that have been fixed.)*

This release contains no bug fixes scoped to CASE.


## Documentation

Generated documentation is available at this site:

[https://ontology.caseontology.org/](https://ontology.caseontology.org/)

Be aware that the documentation at that site will only show the most recent release.  The upper-left corner of the documentation pages shows the ontology version being reviewed.

Users interested in seeing the rendered documentation at this version "Back in time" should locally clone the ontology documentation repository, checking out [this branch](https://github.com/casework/ontology.caseontology.org/tree/archive/release-1.2.0), and follow the deployment directions in `CONTRIBUTE.md`.
