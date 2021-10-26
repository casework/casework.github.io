---
title: 0.5.0 Release
layout: releases
custom_css: releases
---

# {{ page.title }}

*Date: 2021-10-26*

## Ontology File(s)

[GitHub](https://github.com/casework/CASE/releases/tag/0.5.0)

## Migration guidance

From CASE 0.4.0 to CASE 0.5.0, includes
* Any usage of `investigation:startTime` and `investigation:endTime` should be replaced with `uco-core:startTime` and `uco-core:endTime`, respectively.

## Release Notes

### Focus

The focus of this release is on:
* Changing the current property restrictions and domain assertions to SHACL class shapes in order to provide data restriction verification;
* Adopting and importing UCO 0.7.0, which includes changes brought forward by the CASE community.

### Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology.)*

Throughout this section, many of the notes are tied to Change Proposals.  These proposals are available on CASE's [Reference Material page](/resources/references.html).

#### Development Changes

*(These are changes to ontology development practice, and are not necessarily changes to ontology data.)*

* UCO is now tracked as a [Git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) in the [CASE ontology repository](https://github.com/casework/CASE/).  The submodule pointer denotes the version of UCO that CASE has adopted.
* The CASE ontology repository now also includes as part of Continuous Integration a test suite with [subclass property inheritance satisfiability review](https://github.com/casework/CASE-Utility-SHACL-Inheritance-Reviewer), and [example data](https://github.com/casework/CASE/tree/0.5.0/tests/examples) to demonstrate SHACL validation.

#### Breaking Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology that make the new release non-backward-compatible.)*

* DELETED: `investigation:startTime` and `investigation:endTime` properties from investigation-da.ttl
  *([Change Proposal 42](https://drive.google.com/file/d/1JDkSrI7bpVtr2aJ_8lLLa0BrLnBKpEOp/view))* 


#### Changes

*(These are general changes to the preexisting ontology that are not breaking or range changes.)*

* Fix broken link to website examples gallery in README
  *([Change Proposal 37](https://drive.google.com/file/d/16maCSg22Tfwro3OXajT6aYXfLhiihgL4/view))*
* Adopt UCO 0.7.0
  *([Change Proposal 40](https://drive.google.com/file/d/1JqPx0ngdFKGxxOgGD1UgwuT9LgM4SKUV/view))* 
* Convert property restrictions and domain assertions to SHACL class shapes
  *([Change Proposal 41](https://drive.google.com/file/d/1sKFTTiEe-LmQLEG1Bowf52QF1VPZDssL/view))* 
