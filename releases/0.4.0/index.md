---
title: 0.4.0 Release
layout: releases
custom_css: releases
---

# {{ page.title }}

*Date: 2021-05-27*

## Ontology File(s)

[GitHub](https://github.com/casework/CASE/releases/tag/0.4.0)

## Migration guidance

In terms of CASE-namespaced concepts, release 0.4.0 is only additive to 0.3.0.  Hence, migration from CASE 0.3.0 does not require alterations to existing data.  However, one concept in the newly adopted UCO version does not offer an automatic migration path.  `observable:contactName` was removed in UCO 0.6.0.  Data housed in that property should be migrated to either `observable:displayName` or `observable:nickname` as the CASE-producing user or tool finds appropriate.  Other migration guidance for properties upgraded in UCO 0.6.0 can be found via the [UCO 0.6.0 release page](https://unifiedcyberontology.org/releases/0.6.0/).

## Release Notes

### Focus

The focus of this release is on:
* providing an easy way to produce a provenance chain for evidence objects up to and including their moment of emergence in the investigation. This is modeled after the [PROV-O ontology](https://www.w3.org/TR/prov-o/).
* upgrading to UCO 0.6.0, which includes changes brought forward by the CASE community.

### Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology.)*

Throughout this section, many of the notes are tied to Change Proposals.  These proposals are available on CASE's [Reference Material page](/resources/references.html).

#### Development Changes

*(These are changes to ontology development practice, and are not necessarily changes to ontology data.)*

* Revise merge review procedures and ChangeLog format to allow asynchronous change proposal posting
  *(Change Proposal 27)* 

#### Breaking Changes

*(These are changes to ontologies, classes or properties in the preexisting ontology that make the new release non-backward-compatible.)*

* None


#### Changes

*(These are general changes to the preexisting ontology that are not breaking or range changes.)*

* Revise ontology IRI to be slash-based and drop resource-type
  *(Change Proposal 34)*
* Adopt UCO 0.6.0
  *(Change Proposal 28)* 
* Add transitive property to report causal chain of a derived object
  *(Change Proposal 21)* 
* Add rootExhibitNumber property to ProvenanceRecord
  *(Change Proposal 22)* 
* exhibitNumber does not have a definition
  *(Change Proposal 35)* 
