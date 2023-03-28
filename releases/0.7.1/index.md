---
title: 0.7.1 Release
layout: releases
custom_css: releases
---

# {{ page.title }}

*Date: 2022-08-31*

## Ontology File(s)

[GitHub](https://github.com/casework/CASE/releases/tag/0.7.1)


## Release Notes


CASE 0.7.1 implements a starting point in CASE for ontology version designation and backwards-compatibility tracking.  OWL versioning features are implemented and tested on top of UCO 0.9.1 and CASE 0.7.0, as part of demonstrating version incrementing for CASE's and UCO's 1.0.0 releases and exercising the documentation deployment process.  One feature backport prepared for CASE 1.0.0 was incorporated into 0.7.1, but no other changes are implemented since CASE 0.7.0.


### Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology.)*


#### Breaking Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology that make the new release non-backward-compatible.)*

* Removed CASE's IRI base ([*GitHub Pull Request 103*](https://github.com/casework/CASE/pull/103)) 


#### General changes

*(These are general changes to the preexisting ontology that are not breaking or range changes.)*

* `owl:versionIRI` and CASE- and UCO-specific tests for its usage in the transitive closure of `owl:imports` between UCO ontologies have been added  ([*GitHub Issue 437*](https://github.com/ucoProject/UCO/issues/437))


## Documentation

Generated documentation is available at this site:

[https://ontology.caseontology.org/](https://ontology.caseontology.org/)

Be aware that the documentation at that site will only show the most recent release.  The upper-left corner of the documentation pages shows the ontology version being reviewed.

Users interested seeing the rendered documentation at this version "Back in time" should locally clone the repository, check out [this branch](https://github.com/casework/ontology.caseontology.org/tree/archive/release-0.7.1), and follow the deployment directions in `CONTRIBUTE.md`.
