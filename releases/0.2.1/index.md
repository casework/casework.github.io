---
title: 0.2.1 Release
layout: releases
custom_css: releases
---

# {{ page.title }}

*Date: TBD*

## Ontology File(s)

[GitHub](https://github.com/casework/CASE/releases/tag/0.2.1)

## Migration guidance

In terms of CASE-namespaced concepts, release 0.2.1 is a patch to 0.2.0.  Migration from CASE 0.2.0 does not require alterations to existing data, except that ontology prefixes will now encode the ontology version in the concept IRI.

## Release Notes

### Focus

The focus of this patch is on IRI's:
* slash based as opposed to #-based IRI's


### Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology.)*

Throughout this section, many of the notes are tied to Change Proposals.  These proposals are available on CASE's [Reference Material page](/resources/references.html).

#### Development Changes

*(These are changes to ontology development practice, and are not necessarily changes to ontology data.)*

* None

#### Breaking Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology that make the new release non-backward-compatible.)*

* None


#### Changes

*(These are general changes to the preexisting ontology that are not breaking or range changes.)*

* rdf-toolkit base-iri flag degenerates versionIRI when slash IRI form is used
  *([Change Proposal 38](https://drive.google.com/file/d/1T7ZmDZuslKAGc2HA3PPYhSmKqDDoqfkt/view))* 

