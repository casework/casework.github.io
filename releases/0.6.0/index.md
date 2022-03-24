---
title: 0.6.0 Release
layout: releases
custom_css: releases
---

# {{ page.title }}

*Date: 2022-03-24*

## Ontology File(s)

[GitHub](https://github.com/casework/CASE/releases/tag/0.6.0)


## Migration guidance

A guide to migration from CASE 0.5.0 is [here](migration/).


## Release Notes


### Focus

The focus of this release is on:
* Aligning exhibit number and root exhibit number definitions.
* Adopting and importing UCO 0.8.0, which includes changes brought forward by the CASE community.


### Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology.)*

Throughout this section, many of the notes are tied to Change Proposals.  These proposals are available on CASE's [Reference Material page](/resources/references.html).


#### Breaking Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology that make the new release non-backward-compatible.)*

While no breaking changes were implemented in CASE directly, the adopted version of UCO did implement breaking changes.  Please refer to the [UCO 0.8.0 release notes](https://unifiedcyberontology.org/releases/0.8.0/).


#### General changes

*(These are general changes to the preexisting ontology that are not breaking or range changes.)*

* Revise the definitions of 'rootExhibitNumber' and 'exhibitNumber' for better alignment
  *([Change Proposal 36](https://drive.google.com/file/d/114XogkDDIqciWuJBJ3oRlMR5HoHCXwU7/view))*
* Make sh:targetClass shape application statements consistent between CASE and UCO
  *([Change Proposal 44](https://drive.google.com/file/d/1GN9lbqTpWLiU-TGPj53wYQzTQ9AvYb4l/view))*
