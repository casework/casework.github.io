---
title: 1.5.0 Release
layout: releases
custom_css: releases
---

# {{ page.title }}

*Date: 2026-07-24*


## Ontology File(s)

[GitHub](https://github.com/casework/CASE/releases/tag/1.5.0)


## Release Notes

CASE 1.5.0 incorporates required refinements and updates, building on the stable 1.0.0 release.  Following [SemVer](https://semver.org/spec/v2.0.0.html), additive improvements will continue to be accepted, but backwards-incompatible changes will be scheduled only for the 2.0.0 release, which will come after at least 6 months to possibly 12 months.

This release adopts [UCO 1.5.0](https://unifiedcyberontology.org/releases/1.5.0/), incorporating bugfixes and test improvements from UCO 1.5.0.

With the adoption of UCO 1.5.0, [`uco-action:Technique` is now available](https://github.com/ucoProject/UCO/issues/666), so `case-investigation:InvestigativeAction` specializations may now be enumerated within frameworks and extended without confusion to the original framework.  The [UCO 1.5.0 tests for `uco-action:Technique`](https://github.com/ucoProject/UCO/tree/1.5.0/tests/examples/technique) show how `Technique`s can be used, have their usage tested, and extended.


### Focus


#### Breaking Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology that make the new release non-backward-compatible.)*


#### Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology.)*

*  Added CASE `investigation:Investigator` subclasses: Academic, Civil Society, Corporate, Human Rights, Insurance, Intelligence, Law Enforcement, Military, Private, Regulatory ([*CASE GitHub Issue 178*](https://github.com/casework/CASE/issues/178))


#### Bug Fixes

*(These are bugs found within the preexisting ontology that have been fixed.)*


## Documentation

Generated documentation is available at this site:

[https://ontology.caseontology.org/](https://ontology.caseontology.org/)

Be aware that the documentation at that site will only show the most recent release.  The upper-left corner of the documentation pages shows the ontology version being reviewed.

Users interested in seeing the rendered documentation at this version "Back in time" should locally clone the ontology documentation repository, checking out [this branch](https://github.com/casework/ontology.caseontology.org/tree/archive/release-1.5.0), and follow the deployment directions in `CONTRIBUTE.md`.
