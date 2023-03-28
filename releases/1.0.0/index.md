---
title: 1.0.0 Release
layout: releases
custom_css: releases
---

# {{ page.title }}

*Date: 2022-08-31*

## Ontology File(s)

[GitHub](https://github.com/casework/CASE/releases/tag/1.0.0)


## Release Notes

CASE 1.0.0 incorporates required refinements and updates to provide a stable version for adopters to use. Following [SemVer](https://semver.org/spec/v2.0.0.html), additive improvements will continue to be accepted, but backwards-incompatible changes will be scheduled only for the 2.0.0 release, which will come after at least 6 months to possibly 12 months.


### Focus



### Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology.)*


#### Breaking Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology that make the new release non-backward-compatible.)*

* Replaced UCO's glom_graph.py reference with rdfpipe ([*GitHub Pull Request 99*](https://github.com/casework/CASE/pull/99))
* Applied semi-open vocabulary patterns ([*GitHub Pull Request 100*](https://github.com/casework/CASE/pull/100))
* Added OWL 2 DL review with SHACL-SPARQL for UCO ([*Github Pull Request 102*](https://github.com/casework/CASE/pull/102))
  * (While this is not necessarily a backwards-incompatible change within the scope of UCO, it does identify what end users might not have realized were broader OWL errors.)
* Removed CASE's IRI base ([*GitHub Pull Request 103*](https://github.com/casework/CASE/pull/103)) 
* Graph individuals are now required to not be blank nodes, and an IRI ending with a UUID is suggested ([*UCO GitHub Issue 430*](https://github.com/ucoProject/UCO/issues/430))
* CASE now uses `owl:versionIRI`, `owl:priorVersion` and `owl:backwardCompatibleWith` or `owl:incompatibleWith` to declare and relate ontology versions ([*UCO GitHub Issue 437*](https://github.com/ucoProject/UCO/issues/437))
  * (Due to new OWL-level testing, this has the same backwards-incompatibility interpretation as Pull Request 102.)


#### General changes

*(These are general changes to the preexisting ontology that are not breaking or range changes.)*

* Changed minCount from 1 to 0 on multiple properties ([*GitHub Issue 98*](https://github.com/casework/CASE/issues/98))
* Fixed Makefile to grab all of UCO's files, even those under different directories ([*GitHub Pull Request 101*](https://github.com/casework/CASE/pull/101))
* Removed requirement of repeating all property constraints from parent to child classes ([*UCO GitHub Issue 417*](https://github.com/ucoProject/UCO/issues/417))

#### Bug Fixes
*(These are bugs found within the preexisting ontology that have been fixed.)*

* Isodate fails to install (removed legacy requirements) ([*GitHub Issue 106*](https://github.com/casework/CASE/issues/106))


## Documentation

Generated documentation is available at this site:

[https://ontology.caseontology.org/](https://ontology.caseontology.org/)

Be aware that the documentation at that site will only show the most recent release.  The upper-left corner of the documentation pages shows the ontology version being reviewed.

Users interested in seeing the rendered documentation at this version "Back in time" should locally clone the ontology documentation repository, checking out [this branch](https://github.com/casework/ontology.caseontology.org/tree/archive/release-1.0.0), and follow the deployment directions in `CONTRIBUTE.md`.
