---
title: Migration guide
---

This page documents data migration from CASE 0.5.0 to CASE 0.6.0.


## Action properties

UCO 0.8.0 removed the `uco-action:ActionReferencesFacet` class, moving its properties directly to `uco-action:Action`.  Hence, usage of the CASE `InvestigativeAction` class should also remove this Facet and move its properties directly to the `InvestigativeAction` instance.


## SHACL validation and semi-open vocabularies

SHACL enforcement on UCO semi-open vocabularies is now active, except for `uco-core:kindOfRelationship`.  Strings that are used and not part of a suggested vocabulary are now flagged with `sh:ValidationResult`s.  Note that UCO 0.8.0 recorded this enforcement as a breaking changes, as there can be an effect on Continuous Integration (CI) testing that incorporates SHACL validation.  SHACL validation will now fail in some cases of vocabulary usage that are not conformant with CASE 0.6.0.

If a plain `xsd:string` is used where a vocabulary or string is expected, an `sh:Info`-severity result is now returned.  Note that some SHACL validation tools can be adjusted to permit a passing conformance result with only `sh:Info`-level validation results.

If a string value is declared to be part of a vocabulary in the UCO `vocabulary` namespace, but is not included, a `sh:Violation`-severity result is returned.

The above is *not necessarily* a data migration note, but is instead notice that intended usage of vocabularies is now reviewed as part of the SHACL validation framework.

However, one effect of implementing this mechanism was discovery of an incompatibility with `core:kindOfRelationship` usage.  The UCO Ontology Committee decided that the best available option at present is to remove all datatype annotations from `core:kindOfRelationship`.  Hence, if you have anywhere data following this form:

```json
{
    "@id": "kb:some-relationship",
    "@type": "uco-observable:ObservableRelationship",
    "uco-core:kindOfRelationship": {
        "@type": "uco-vocabulary:ObservableObjectRelationshipVocab",
        "@value": "Contained_Within"
    }
}
```

With CASE 0.6.0 and UCO 0.8.0, an untyped string should be used:

```json
{
    "@id": "kb:some-relationship",
    "@type": "uco-observable:ObservableRelationship",
    "uco-core:kindOfRelationship": "Contained_Within"
}
```

CASE and UCO are aware this is a weakening of data review, and are reviewing options for how to restore review.  Users intending to use values encoded in the ontologies are encouraged to use the string spellings within the vocabulary namespace's relationship vocabularies, to ease migration in a future release.


## IRI prefix updates

All UCO IRI prefixes now follow the same form CASE IRIs follow.  For instance, the `uco-action` prefix would previously have appeared in a JSON-LD context dictionary like this (including `case-investigation` for similarity illustration):

```json
{
    "@context": {
        ...
        "case-investigation": "https://ontology.caseontology.org/case/investigation/",
        ...
        "uco-action": "https://unifiedcyberontology.org/ontology/uco/action#",
        ...
    },
    "@graph": [
        ...
    ]
}
```

As of UCO 0.8.0, the prefix for `uco-action` and likewise, follows this form - from the `ontology.` subdomain, path starting `/uco` instead of `/ontology`, and ending with a slash instead of hash:

```json
{
    "@context": {
        ...
        "case-investigation": "https://ontology.caseontology.org/case/investigation/",
        ...
        "uco-action": "https://ontology.unifiedcyberontology.org/uco/action/",
        ...
    },
    "@graph": [
        ...
    ]
}
```

For updating prefixes, no modification to data under `"@graph"` is necessary.
