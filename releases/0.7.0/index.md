---
title: 0.7.0 Release
layout: releases
custom_css: releases
---

# {{ page.title }}

*Date: 2022-06-17*

## Ontology File(s)

[GitHub](https://github.com/casework/CASE/releases/tag/0.7.0)


## Release Notes


### Focus

CASE 0.7.0 primarily focused on workflow technology transitions, and was necessitated by a Java dependency upgrade.  The workflow used to normalize Turtle files in the newly adopted [UCO 0.9.0](https://unifiedcyberontology.org/releases/0.9.0/) and its downstream repositories---including the CASE ontology and other CASE projects---now minimally requires Java 11.  The workflow to interface with the UCO and CASE ontologies has transitioned to Github Issues, which has caused some files related to programming Github interfaces to become versioned with the ontology.


### Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology.)*


#### Breaking Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology that make the new release non-backward-compatible.)*

* Updated rdf-toolkit to version 1.11.0 and Java to version 11 ([*GitHub Issue 373*](https://github.com/ucoProject/UCO/issues/373))

While no other breaking changes were implemented in CASE directly, the adopted version of UCO did implement breaking changes.  Please refer to the [UCO 0.9.0 release notes](https://unifiedcyberontology.org/releases/0.9.0/).

#### General changes

*(These are general changes to the preexisting ontology that are not breaking or range changes.)*

* Fixed typos in investigation:ExaminerActionLifecycle ([*GitHub Pull Request 69*](https://github.com/casework/CASE/pull/69))


## Documentation

Starting with CASE 0.7.0, generated documentation is available at this site:

[https://ontology.caseontology.org/](https://ontology.caseontology.org/)

Be aware that the documentation will show the most recent release, until an ontology versioning strategy currently in initial implementation completes its testing.  The upper-left corner of the documentation pages shows the ontology version being reviewed.

Users interested seeing the rendered documentation at this version "Back in time" should locally clone the repository, check out [this branch](https://github.com/casework/ontology.caseontology.org/tree/archive/release-0.7.0), and follow the deployment directions in `CONTRIBUTE.md`.
