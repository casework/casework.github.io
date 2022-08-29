---
title: 1.0.0 Release
layout: releases
custom_css: releases
---

# {{ page.title }}

#TBD

## Ontology File(s)



## Release Notes


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
* Removed requirement of repeating all property constraints from parent to child classes ([*UCO GitHub Issue 417*](https://github.com/ucoProject/UCO/issues/417))

#### General changes

*(These are general changes to the preexisting ontology that are not breaking or range changes.)*

* Changed minCount from 1 to 0 on multiple properties ([*GitHub Issue 98*](https://github.com/casework/CASE/issues/98))
* Fixed Makefile to grab all of UCO's files, even those under different directories ([*GitHub Pull Request 101*](https://github.com/casework/CASE/pull/101))

## Documentation

