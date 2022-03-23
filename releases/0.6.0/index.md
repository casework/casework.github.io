---
title: 0.6.0 Release
layout: releases
custom_css: releases
---

# {{ page.title }}

*Date: 2022-03-23*

## Ontology File(s)

[GitHub](https://github.com/casework/CASE/releases/tag/0.6.0)


## Migration guidance

A guide to migration from CASE 0.5.0 is [here](migration/).


## Release Notes


### Focus

The focus of this release is on:
* Aligning exhibit number and root exhibit number definitions.
* Adopting and importing UCO 0.8.0, which includes changes brought forward by the CASE community.

Work done by CASE in the 0.6.0 release cycle was mostly in efforts adjacent to the CASE ontology repository.
* CASE contributed bug fixes, design input, and new class and property development for UCO.
* CASE documentation and full-ontology encoding files now resolve in a manner consistent with their IRIs, being served as Turtle and RDF.
* Example development practice now incorporates SHACL validation against pre-release states of CASE and UCO.
* CASE examples have received revisions addressing many SHACL validation issues.


### Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology.)*

Throughout this section, many of the notes are tied to Change Proposals.  These proposals are available on CASE's [Reference Material page](/resources/references.html).


#### Changes

*(These are general changes to the preexisting ontology that are not breaking or range changes.)*

* Revise the definitions of 'rootExhibitNumber' and 'exhibitNumber' for better alignment
  *([Change Proposal 36](https://drive.google.com/file/d/114XogkDDIqciWuJBJ3oRlMR5HoHCXwU7/view))*
* Make sh:targetClass shape application statements consistent between CASE and UCO
  *([Change Proposal 44](https://drive.google.com/file/d/1GN9lbqTpWLiU-TGPj53wYQzTQ9AvYb4l/view))*
