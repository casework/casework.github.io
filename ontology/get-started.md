---
title: Get Started
jumbo_desc: Get started with CASE using code examples.
---

* Display table of contents (this line will not be displayed)
{:toc}


# Get Started with CASE

The full collection of libraries, tools, and documentation for CASE is available on the [CASE GitHub](https://github.com/casework) repository. This guide walks through the anatomy of a CASE graph, full CASE example graph, and how to generate, validate, and query CASE graphs.


## Disclaimer

Portions of this page contributed by NIST are governed by the following statement:

> Participation by NIST in the creation of the documentation of mentioned software is not intended to imply a recommendation or endorsement by the National Institute of Standards and Technology, nor is it intended to imply that any specific software is necessarily the best available for the purpose.


## Anatomy of a CASE Graph

CASE uses JSON-LD which is JSON with linked relationships between objects within the JSON. It contains two top-level keys, `@context` and `@graph`. The `@context` key is a mapping of aliases and namespaces that point to namespaces within the UCO and CASE ontologies. The `@graph` key is an array/list of objects that represent the data being exchanged.

Each object within the `@graph` key is a JSON object (i.e., string-keyed dictionary), which contains at least an `@id` key that is a unique identifier for the object. The `@type` key is the aliased type of the object, using a reference for some class within the ontology compacted in line with the `@context` dictionary's assistance. The available and required properties are defined in the ontology schema. A mimimal example is:

```json
{
    "@context": {
        "kb": "http://example.org/kb/",
        "uco-location": "https://ontology.unifiedcyberontology.org/uco/location/"
    },
    "@graph": {
        "@id": "kb:location-4511219e-a924-4ba5-aee7-dfad5a2c9c05",
        "@type": "uco-location:Location"
    }
}
```

This example demonstrates a few aspects of CASE and JSON-LD that are specialized over general JSON:

* The prefixes in the `@context` object, aka "context dictionary," often are used in CASE JSON-LD to compact IRIs into a "prefix:local part" form.  Prefixes include some typically fixed values, and typically customized values.
   - Typically *fixed* prefix values are for ontologies that provide classes and properties.  In CASE, often these will include ontologies starting `case-*` and `uco-*`.
   - `kb` is an example of a typically *customized* prefix, and is used in CASE examples for "Knowledge base" members.  `kb` does not need to be fixed to `http://example.org/kb/`.  That prefix IRI is only used because of DNS treatment practices around `example.org` (see [RFC 6761, Section 6.5](https://www.rfc-editor.org/rfc/rfc6761.html#section-6.5)).
* Graph-individuals, identified by the string following `@id`, are suggested in CASE and UCO to have identifiers end with a UUID.  This prevents issues with ambiguities when multiple workflows or processes model similarly-structured individuals that in reality are independent things.
   - For example, this avoids two directory-walking script emiting objects as `kb:File-1`, `kb:File-2`, etc., sourced from different directories.  If loaded later into one graph, the matched names would collapse and collect each others' properties, and present conflicting information like "There exists a `uco-observable:File`, `kb:File-1`, created at both `2024-01-01T01:23:45Z` and `2018-09-10T23:56:47Z`."
* `@graph` children, and `@graph` itself, *may* use JSON Arrays (lists) in places where multiple objects may be linked, but where one object is concerned, the array-wrapping is optional in general JSON-LD syntax.  This minimal example graph transmits one "Location" object, and *opts* to skip a wrapping array.  Often, graphs will contain multiple top-level objects - the "Full CASE Example Graph" below contains two.  This could be a point of confusion for JSON consuming applications that are not JSON-LD aware.  Requirement of arrays can be agreed upon between data producers and consumers by settling on `@container` specifications in the context dictionary (such as `{"@container": "@set"}`, described [here, illustrated in example 86](https://www.w3.org/TR/json-ld11/#sets).

One characteristic of JSON-LD is that it is a concrete syntax for RDF.  There are translation mechanisms that convert between various concrete syntaxes, which can serve as an elementary syntax check of JSON as JSON-LD.  The example graph above encodes one statement - that there is a thing with ID `kb:location-4511219e-...`, and RDF-type `uco-location:Location`.  A graph-consuming application could read a JSON-LD file and translate to confirm statements survive a load-save round-trip.  For instance, here is the above graph in various other RDF syntaxes:

{% tabs concrete %}

{% tab concrete Turtle %}

```turtle
@prefix kb: <http://example.org/kb/> .
@prefix uco-location: <https://ontology.unifiedcyberontology.org/uco/location/> .

kb:location-4511219e-a924-4ba5-aee7-dfad5a2c9c05 a uco-location:Location .
```

{% endtab %}

{% tab concrete N-Triples %}

```turtle
<http://example.org/kb/location-4511219e-a924-4ba5-aee7-dfad5a2c9c05> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://ontology.unifiedcyberontology.org/uco/location/Location> .
```

{% endtab %}

{% tab concrete RDF-XML %}

```xml
<?xml version="1.0" encoding="utf-8"?>
<rdf:RDF
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
>
  <rdf:Description rdf:about="http://example.org/kb/location-4511219e-a924-4ba5-aee7-dfad5a2c9c05">
    <rdf:type rdf:resource="https://ontology.unifiedcyberontology.org/uco/location/Location"/>
  </rdf:Description>
</rdf:RDF>
```

{% endtab %}

{% endtabs %}


### Full CASE Example Graph

A full (basic) example of a CASE JSON-LD output is below:

```json
{
    "@context": {
        "@vocab": "http://example.org/local#",
        "kb": "http://example.org/kb/",
        "uco-core": "https://ontology.unifiedcyberontology.org/uco/core/",
        "uco-location": "https://ontology.unifiedcyberontology.org/uco/location/",
        "xsd": "http://www.w3.org/2001/XMLSchema#"
    },
    "@graph": [
        {
            "@id": "kb:location-4511219e-a924-4ba5-aee7-dfad5a2c9c05",
            "@type": "uco-location:Location",
            "uco-core:hasFacet": [
                {
                    "@id": "kb:simple-address-facet-59334948-00b9-4370-85b0-4dc8e07f5384",
                    "@type": "uco-location:SimpleAddressFacet",
                    "uco-location:locality": "Seattle",
                    "uco-location:region": "WA",
                    "uco-location:postalCode": "98052",
                    "uco-location:street": "20341 Whitworth Institute 405 N. Whitworth"
                }
            ]
        },
        {
            "@id": "kb:location-b579264d-6e30-4055-bf9b-72390364f224",
            "@type": "uco-location:Location",
            "uco-core:hasFacet": [
                {
                    "@id": "kb:simple-address-facet-258f169e-1e9c-4936-ba65-eed0f0c60788",
                    "@type": "uco-location:SimpleAddressFacet",
                    "uco-location:locality": "Paris",
                    "uco-location:country": "France",
                    "uco-location:postalCode": "F-75002",
                    "uco-location:street": "38 Bad Guy Headquarters st."
                },
                {
                    "@id": "kb:lat-long-coordinates-facet-36126f9c-0273-48fe-ad4d-6a4e2848458f",
                    "@type": "uco-location:LatLongCoordinatesFacet",
                    "uco-location:latitude": {
                        "@type": "xsd:decimal",
                        "@value": "48.860346"
                    },
                    "uco-location:longitude": {
                        "@type": "xsd:decimal",
                        "@value": "2.331199"
                    }
                }
            ]
        }
    ]
}
```

The same graph reads as follows in alternate syntaxes:

{% tabs concrete %}

{% tab concrete Turtle %}

```turtle
@prefix kb: <http://example.org/kb/> .
@prefix uco-core: <https://ontology.unifiedcyberontology.org/uco/core/> .
@prefix uco-location: <https://ontology.unifiedcyberontology.org/uco/location/> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

kb:location-4511219e-a924-4ba5-aee7-dfad5a2c9c05 a uco-location:Location ;
    uco-core:hasFacet kb:simple-address-facet-59334948-00b9-4370-85b0-4dc8e07f5384 .

kb:location-b579264d-6e30-4055-bf9b-72390364f224 a uco-location:Location ;
    uco-core:hasFacet kb:lat-long-coordinates-facet-36126f9c-0273-48fe-ad4d-6a4e2848458f,
        kb:simple-address-facet-258f169e-1e9c-4936-ba65-eed0f0c60788 .

kb:lat-long-coordinates-facet-36126f9c-0273-48fe-ad4d-6a4e2848458f a uco-location:LatLongCoordinatesFacet ;
    uco-location:latitude 48.860346 ;
    uco-location:longitude 2.331199 .

kb:simple-address-facet-258f169e-1e9c-4936-ba65-eed0f0c60788 a uco-location:SimpleAddressFacet ;
    uco-location:country "France" ;
    uco-location:locality "Paris" ;
    uco-location:postalCode "F-75002" ;
    uco-location:street "38 Bad Guy Headquarters st." .

kb:simple-address-facet-59334948-00b9-4370-85b0-4dc8e07f5384 a uco-location:SimpleAddressFacet ;
    uco-location:locality "Seattle" ;
    uco-location:postalCode "98052" ;
    uco-location:region "WA" ;
    uco-location:street "20341 Whitworth Institute 405 N. Whitworth" .

```

{% endtab %}

{% tab concrete N-Triples %}

```turtle
<http://example.org/kb/lat-long-coordinates-facet-36126f9c-0273-48fe-ad4d-6a4e2848458f> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://ontology.unifiedcyberontology.org/uco/location/LatLongCoordinatesFacet> .
<http://example.org/kb/lat-long-coordinates-facet-36126f9c-0273-48fe-ad4d-6a4e2848458f> <https://ontology.unifiedcyberontology.org/uco/location/latitude> "48.860346"^^<http://www.w3.org/2001/XMLSchema#decimal> .
<http://example.org/kb/lat-long-coordinates-facet-36126f9c-0273-48fe-ad4d-6a4e2848458f> <https://ontology.unifiedcyberontology.org/uco/location/longitude> "2.331199"^^<http://www.w3.org/2001/XMLSchema#decimal> .
<http://example.org/kb/location-4511219e-a924-4ba5-aee7-dfad5a2c9c05> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://ontology.unifiedcyberontology.org/uco/location/Location> .
<http://example.org/kb/location-4511219e-a924-4ba5-aee7-dfad5a2c9c05> <https://ontology.unifiedcyberontology.org/uco/core/hasFacet> <http://example.org/kb/simple-address-facet-59334948-00b9-4370-85b0-4dc8e07f5384> .
<http://example.org/kb/location-b579264d-6e30-4055-bf9b-72390364f224> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://ontology.unifiedcyberontology.org/uco/location/Location> .
<http://example.org/kb/location-b579264d-6e30-4055-bf9b-72390364f224> <https://ontology.unifiedcyberontology.org/uco/core/hasFacet> <http://example.org/kb/lat-long-coordinates-facet-36126f9c-0273-48fe-ad4d-6a4e2848458f> .
<http://example.org/kb/location-b579264d-6e30-4055-bf9b-72390364f224> <https://ontology.unifiedcyberontology.org/uco/core/hasFacet> <http://example.org/kb/simple-address-facet-258f169e-1e9c-4936-ba65-eed0f0c60788> .
<http://example.org/kb/simple-address-facet-258f169e-1e9c-4936-ba65-eed0f0c60788> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://ontology.unifiedcyberontology.org/uco/location/SimpleAddressFacet> .
<http://example.org/kb/simple-address-facet-258f169e-1e9c-4936-ba65-eed0f0c60788> <https://ontology.unifiedcyberontology.org/uco/location/country> "France" .
<http://example.org/kb/simple-address-facet-258f169e-1e9c-4936-ba65-eed0f0c60788> <https://ontology.unifiedcyberontology.org/uco/location/locality> "Paris" .
<http://example.org/kb/simple-address-facet-258f169e-1e9c-4936-ba65-eed0f0c60788> <https://ontology.unifiedcyberontology.org/uco/location/postalCode> "F-75002" .
<http://example.org/kb/simple-address-facet-258f169e-1e9c-4936-ba65-eed0f0c60788> <https://ontology.unifiedcyberontology.org/uco/location/street> "38 Bad Guy Headquarters st." .
<http://example.org/kb/simple-address-facet-59334948-00b9-4370-85b0-4dc8e07f5384> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <https://ontology.unifiedcyberontology.org/uco/location/SimpleAddressFacet> .
<http://example.org/kb/simple-address-facet-59334948-00b9-4370-85b0-4dc8e07f5384> <https://ontology.unifiedcyberontology.org/uco/location/locality> "Seattle" .
<http://example.org/kb/simple-address-facet-59334948-00b9-4370-85b0-4dc8e07f5384> <https://ontology.unifiedcyberontology.org/uco/location/postalCode> "98052" .
<http://example.org/kb/simple-address-facet-59334948-00b9-4370-85b0-4dc8e07f5384> <https://ontology.unifiedcyberontology.org/uco/location/region> "WA" .
<http://example.org/kb/simple-address-facet-59334948-00b9-4370-85b0-4dc8e07f5384> <https://ontology.unifiedcyberontology.org/uco/location/street> "20341 Whitworth Institute 405 N. Whitworth" .
```

{% endtab %}

{% tab concrete RDF-XML %}

```xml
<?xml version="1.0" encoding="utf-8"?>
<rdf:RDF
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:uco-core="https://ontology.unifiedcyberontology.org/uco/core/"
   xmlns:uco-location="https://ontology.unifiedcyberontology.org/uco/location/"
>
  <rdf:Description rdf:about="http://example.org/kb/location-b579264d-6e30-4055-bf9b-72390364f224">
    <rdf:type rdf:resource="https://ontology.unifiedcyberontology.org/uco/location/Location"/>
    <uco-core:hasFacet rdf:resource="http://example.org/kb/simple-address-facet-258f169e-1e9c-4936-ba65-eed0f0c60788"/>
    <uco-core:hasFacet rdf:resource="http://example.org/kb/lat-long-coordinates-facet-36126f9c-0273-48fe-ad4d-6a4e2848458f"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://example.org/kb/simple-address-facet-59334948-00b9-4370-85b0-4dc8e07f5384">
    <rdf:type rdf:resource="https://ontology.unifiedcyberontology.org/uco/location/SimpleAddressFacet"/>
    <uco-location:locality>Seattle</uco-location:locality>
    <uco-location:region>WA</uco-location:region>
    <uco-location:postalCode>98052</uco-location:postalCode>
    <uco-location:street>20341 Whitworth Institute 405 N. Whitworth</uco-location:street>
  </rdf:Description>
  <rdf:Description rdf:about="http://example.org/kb/simple-address-facet-258f169e-1e9c-4936-ba65-eed0f0c60788">
    <rdf:type rdf:resource="https://ontology.unifiedcyberontology.org/uco/location/SimpleAddressFacet"/>
    <uco-location:locality>Paris</uco-location:locality>
    <uco-location:country>France</uco-location:country>
    <uco-location:postalCode>F-75002</uco-location:postalCode>
    <uco-location:street>38 Bad Guy Headquarters st.</uco-location:street>
  </rdf:Description>
  <rdf:Description rdf:about="http://example.org/kb/location-4511219e-a924-4ba5-aee7-dfad5a2c9c05">
    <rdf:type rdf:resource="https://ontology.unifiedcyberontology.org/uco/location/Location"/>
    <uco-core:hasFacet rdf:resource="http://example.org/kb/simple-address-facet-59334948-00b9-4370-85b0-4dc8e07f5384"/>
  </rdf:Description>
  <rdf:Description rdf:about="http://example.org/kb/lat-long-coordinates-facet-36126f9c-0273-48fe-ad4d-6a4e2848458f">
    <rdf:type rdf:resource="https://ontology.unifiedcyberontology.org/uco/location/LatLongCoordinatesFacet"/>
    <uco-location:latitude rdf:datatype="http://www.w3.org/2001/XMLSchema#decimal">48.860346</uco-location:latitude>
    <uco-location:longitude rdf:datatype="http://www.w3.org/2001/XMLSchema#decimal">2.331199</uco-location:longitude>
  </rdf:Description>
</rdf:RDF>
```

{% endtab %}

{% endtabs %}

Additional examples are available in the [CASE-Examples](https://github.com/casework/CASE-Examples) repository.  This example was copied from [here](https://github.com/casework/CASE-Examples/blob/master/examples/illustrations/location/location.json).


## Basic Graph Creation

{% tabs log %}

{% tab log Python %}

```python
import json
import uuid

# Build the base graph dictionary with the context. This must contain all the namespaces used in the graph
graph: dict = {
    "@context": {
        "kb": "http://example.org/kb/",
        "uco-core": "https://ontology.unifiedcyberontology.org/uco/core/",
        "uco-location": "https://ontology.unifiedcyberontology.org/uco/location/",
    },
    "@graph": []
}

# Add an object to the graph
graph["@graph"].append({
    "@id": "kb:location-" + str(uuid.uuid4()),
    "@type": "uco-location:Location",
    "uco-core:hasFacet": [
        {
            "@id": "kb:simple-address-facet-" + str(uuid.uuid4()),
            "@type": "uco-location:SimpleAddressFacet",
            "uco-location:locality": "Seattle",
            "uco-location:region": "WA",
            "uco-location:postalCode": "98052",
            "uco-location:street": "20341 Whitworth Institute 405 N. Whitworth"
        }
    ]
})

# Write the dictionary to a JSON file
with open('case.jsonld', 'w') as f:
    json.dump(graph, f, indent=4)
```

{% endtab %}

{% tab log C# %}

```cs
// Install the dependency package: dotnet add package Newtonsoft.Json 
using Newtonsoft.Json;

// Build the base graph dictionary with the context. This must contain all the namespaces used in the graph
Dictionary<string, object> graph = [];
graph["@context"] = new Dictionary<string, object>
{
    ["kb"] = "http://schema.org/",
    ["uco-core"] = "https://ontology.unifiedcyberontology.org/uco/core/",
    ["uco-location"] = "https://ontology.unifiedcyberontology.org/uco/location/"
};

Dictionary<string, object> location = new()
{
    ["@id"] = "kb:location-" + Guid.NewGuid(),
    ["@type"] = "uco-location:Location",
    ["uco-core:hasFacet"] = new List<object>
    {
        new Dictionary<string, object>
        {
            ["@id"] = "kb:simple-address-facet-" + Guid.NewGuid(),
            ["@type"] = "uco-location:SimpleAddressFacet",
            ["uco-location:street"] = "20341 Whitworth Institute 405 N. Whitworth",
            ["uco-location:locality"] = "Seattle",
            ["uco-location:region"] = "WA",
            ["uco-location:postalCode"] = "98052",
        }
    }
};

// Add an object to the graph
graph["@graph"] = new List<object>
{
    location
};

// Write the dictionary to a JSON file
File.WriteAllText("case.jsonld", JsonConvert.SerializeObject(graph, Formatting.Indented));
```

{% endtab %}

{% tab log Java %}

```java
// Depends on org.json (https://mvnrepository.com/artifact/org.json/json)
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.FileWriter;
import java.io.IOException;
import java.util.UUID;

public class GenerateCASE {
    public static void main(String[] args) {
        // Build the base graph JSONObject with the context
        JSONObject graph = new JSONObject();
        
        JSONObject context = new JSONObject();
        context.put("kb", "http://example.org/kb/");
        context.put("uco-core", "https://ontology.unifiedcyberontology.org/uco/core/");
        context.put("uco-location", "https://ontology.unifiedcyberontology.org/uco/location/");
        
        graph.put("@context", context);
        graph.put("@graph", new JSONArray());
        
        // Add an object to the graph
        JSONObject locationObject = new JSONObject();
        locationObject.put("@id", "kb:location-" + UUID.randomUUID());
        locationObject.put("@type", "uco-location:Location");
        
        JSONArray hasFacetArray = new JSONArray();
        
        JSONObject simpleAddressFacet = new JSONObject();
        simpleAddressFacet.put("@id", "kb:simple-address-facet-" + UUID.randomUUID());
        simpleAddressFacet.put("@type", "uco-location:SimpleAddressFacet");
        simpleAddressFacet.put("uco-location:locality", "Seattle");
        simpleAddressFacet.put("uco-location:region", "WA");
        simpleAddressFacet.put("uco-location:postalCode", "98052");
        simpleAddressFacet.put("uco-location:street", "20341 Whitworth Institute 405 N. Whitworth");
        
        hasFacetArray.put(simpleAddressFacet);
        
        locationObject.put("uco-core:hasFacet", hasFacetArray);
        
        graph.getJSONArray("@graph").put(locationObject);
        
        // Write the JSON-LD to a file
        try (FileWriter file = new FileWriter("case.jsonld")) {
            file.write(graph.toString(4)); // 4 is the indent factor for pretty printing
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
```

{% endtab %}

{% endtabs %}


## Validation Tools


### CLI

Once the JSON-LD output is generated, it can be validated for syntactic correctness using the [`case_validate`](https://github.com/casework/CASE-Utilities-Python) tool. The tool is available as a Python package and can be installed using `pip install case-utils`.

```bash
pip install case-utils
```

Then the tool can be run on the generated JSON-LD file which will output any errors or warnings.

```bash
case_validate case.jsonld
```


### Docker

The `case_validate` tool is also available as a Docker image on [Docker Hub](https://hub.docker.com/r/kchason/case-validator). The container can be run with the following command:

```shell
docker run --rm \
	-e CASE_PATH="/opt/case/" \
	-e CASE_VERSION="case-1.3.0" \
	-e CASE_EXTENSION_FILTER="jsonld" \
	-v "/path/to/local:/opt/case" \
	kchason/case-validator:latest
```

Full usage documentation is available at the `kchason/case-validator` [Docker Hub page](https://hub.docker.com/r/kchason/case-validator).


### GitHub Actions

There is a GitHub Action available to validate CASE graphs in a CI/CD pipeline that are wrappers around the `case_validate` tool which makes it easier to test built graphs from unit and integrated testing frameworks.

```yaml
- name: CASE Export Validation
  uses: kchason/case-validation-action@v2.9.0
  with:
    case-path: ./output/
    case-version: "case-1.3.0"
    extension-filter: "jsonld"
```

Full usage documentation is available at the [GitHub Action Marketplace](https://github.com/marketplace/actions/case-ontology-validator) page for the CASE Ontology Validator.


### GitLab CI Component

There is also GitLab CI component available to validate CASE graphs in a CI/CD pipeline that are wrappers around the `case_validate` tool which makes it easier to test built graphs from unit and integrated testing frameworks.

```yaml
include:
  - component: https://gitlab.com/keith.chason/case-validation-example/case-validate@0.1.0
    inputs:
      case-path: tests/data
```

Full usage documentation is available at the [GitLab Repository](https://gitlab.com/keith.chason/case-validation-component).


## Graph Creation Resources

Several libraries and repositories have been developed to assist in the generation of CASE graphs in various programming languages. These libraries provide a more programmatic way to generate CASE graphs using the language's native data structures. These have been categorized between "Bindings" and "Mappings".

Separately, a template repository is available that provides a demonstration command line utility and build system.  This template repository happens to use a Python community graph-library instead of language primitives, but if the bindings or mappings are favored by a developer, the template's build system provides other test infrastructure that is independently assistive.


### Bindings

These libraries use RDF graphs to manage the CASE graph data. They provide a more direct mapping to the RDF data model and are more closely aligned with the underlying ontology but can be more resource intensive.

| Language | Library  | Repository |
|----------|----------|------------|
| C#       | [CipherTech.CASE.Bindings](https://www.nuget.org/packages/CipherTech.CASE.Bindings) | [https://github.com/ciphertechsolutions/CASE-Bindings-CSharp](https://github.com/ciphertechsolutions/CASE-Bindings-CSharp) | 


### Mappings

These libraries use native data structures to manage the CASE graph data. They provide a more programmatic way to generate CASE graphs using the language's native data structures and are then serialized into JSON-LD.

| Language | Library  | Repository |
|----------|----------|------------|
| Python      | [case-mapping](https://pypi.org/project/case-mapping/) | [https://github.com/casework/CASE-Mapping-Python](https://github.com/casework/CASE-Mapping-Python) | 


### Application template

CASE provides a [Python application template repository](https://github.com/casework/CASE-Implementation-Template-Python-CLI) that is one potential style of starting an application.  Lessons learned within the CDO community in maintaining Python repositories are implemented in the template.


## Full CASE Concepts

The rendered documentation for the CASE Ontology, which contains the list of all classes and properties, is available at [https://ontology.caseontology.org](https://ontology.caseontology.org/documentation/index.html).

All of the concepts used in CASE and UCO are identified with IRIs, which redirect to the concept's documentation when visited in a browser.  See for example the location classes used above:

* [`uco-location:Location`](https://ontology.unifiedcyberontology.org/uco/location/Location)
* [`uco-location:LatLongCoordinatesFacet`](https://ontology.unifiedcyberontology.org/uco/location/LatLongCoordinatesFacet)
* [`uco-location:SimpleAddressFacet`](https://ontology.unifiedcyberontology.org/uco/location/SimpleAddressFacet)


### JSON-LD Stubs

Classes in CDO also have "empty" JSON-LD files, sometimes referred to as "stubs," generated to show the properties available in them.  These stubs assist with showing the properties provided by parent classes, and hinting at the available cardinalities (e.g., a property with `none` following has a maximum cardinality of 1, while a property with an empty array following has an unbounded maximum cardinality).  The files are "empty" graphs because each of the statements is incomplete - the `none` and `[]` JSON values are absent information as JSON-LD, and thus would not load in an RDF application.

The classes above have these available stubs:

* [`Location.json`](https://github.com/casework/CASE-Mapping-Template-Stubs/blob/main/templates/uco-location/.json)
* [`LatLongCoordinatesFacet.json`](https://github.com/casework/CASE-Mapping-Template-Stubs/blob/main/templates/uco-location/.json)
* [`SimpleAddressFacet.json`](https://github.com/casework/CASE-Mapping-Template-Stubs/blob/main/templates/uco-location/.json)

To assist with recalling `Facet`s available to each of the `UcoObject` subclasses, the stubs also carry `Facet` suggestions from parent classes.  If some `Facet` happens to have no information available in an application, it is not necessary to specify the `Facet`.

See for instance:

* [`AndroidPhone.json`](https://github.com/casework/CASE-Mapping-Template-Stubs/blob/main/templates/uco-observable/AndroidPhone.json)
* [`BluetoothAddress.json`](https://github.com/casework/CASE-Mapping-Template-Stubs/blob/main/templates/uco-observable/BluetoothAddress.json)
* [`RasterPicture.json`](https://github.com/casework/CASE-Mapping-Template-Stubs/blob/main/templates/uco-observable/RasterPicture.json)


## Query CASE Graphs

A frequent use-case for RDF is graph querying.  JSON-LD users have access to querying using the SPARQL query language.  For instance, the following query can be used to find all street addresses of locations in the knowledge base.  Because these addresses are properties tied to a `uco-location:Location` object, at times, there may be a linked latitude/longitude pair.  This query will find all street addresses, and will optionally find associated latitude/longitude coordinate pairs.

```sparql
PREFIX uco-location: <https://ontology.unifiedcyberontology.org/uco/location/>
PREFIX uco-core: <https://ontology.unifiedcyberontology.org/uco/core/>

SELECT ?lStreet ?lLatitude ?lLongitude
WHERE
{
    ?nLocation
        a uco-location:Location ;
        uco-core:hasFacet ?nSimpleAddressFacet ;
        .
    ?nSimpleAddressFacet
        a uco-location:SimpleAddressFacet ;
        uco-location:street ?lStreet ;
        .
    
    OPTIONAL {
        ?nLocation uco-core:hasFacet ?nLatLongCoordinatesFacet .
        ?nLatLongCoordinatesFacet
            a uco-location:LatLongCoordinatesFacet ;
            uco-location:latitude ?lLatitude ;
            uco-location:longitude ?lLongitude ;
            .
    }
}
ORDER BY ?lStreet
```

Run against the example location graph above, this query returns the following results:

|    | ?lStreet                                   | ?lLatitude   | ?lLongitude   |
|----|--------------------------------------------|--------------|---------------|
|  0 | 20341 Whitworth Institute 405 N. Whitworth |              |               |
|  1 | 38 Bad Guy Headquarters st.                | 48.860346    | 2.331199      |

CASE provides a command-line tool alongside `case_validate`, `case_sparql_select`, which can run a SPARQL query against one or more graph files.  The command is documented [here](https://github.com/casework/CASE-Utilities-Python?tab=readme-ov-file#case_sparql_select).  The above table was generated through a command-line session similar to this one:

```bash
python3 -m venv venv
source .../venv/bin/activate
pip install case-utils
case_sparql_select out.md query.sparql example.jsonld
```

Programming languages will often have libraries available to run SPARQL queries against loaded graphs.  The following examples show how to load a graph file and run a query similar to the query above, but that just gets the street addresses.

Note that SPARQL's syntactic similarities with Turtle extend to subject-sharing in statements.  Though the queries have a different number of words per line, they achieve the same pattern matching pertaining to finding street addresses.

{% tabs log %}

{% tab log Python %}

```python
# Install the dependency package: pip install rdflib
from rdflib import Graph

# Assuming the input of the case.jsonld from previous examples
graph: Graph = Graph()
graph.parse("case.jsonld", format="json-ld")

# Query the graph to list the street(s) in the output
query = """
    PREFIX uco-location: <https://ontology.unifiedcyberontology.org/uco/location/>
    PREFIX uco-core: <https://ontology.unifiedcyberontology.org/uco/core/>

    SELECT ?lStreet
    WHERE
    {
        ?nLocation a uco-location:Location .
        ?nLocation uco-core:hasFacet ?nSimpleAddressFacet .
        ?nSimpleAddressFacet a uco-location:SimpleAddressFacet .
        ?nSimpleAddressFacet uco-location:street ?lStreet .
    }
    """

# Execute the query
results = graph.query(query)

# Print the results to the console
for row in results:
    print(row.lStreet)
```

{% endtab %}

{% tab log C# %}

```cs
// Install the dependency package: dotnet add package dotNetRDF
using VDS.RDF;
using VDS.RDF.Parsing;
using VDS.RDF.Query;
using VDS.RDF.Query.Datasets;


// Load the graph from the JSON-LD file
TripleStore tripleStore = new();
JsonLdParser jsonLdParser = new();
jsonLdParser.Load(tripleStore, "case.jsonld");
ISparqlQueryProcessor queryProcessor = new LeviathanQueryProcessor(new InMemoryDataset(tripleStore));
SparqlQueryParser parser = new();

// Define the SPARQL query
var query = """
            PREFIX uco-location: <https://ontology.unifiedcyberontology.org/uco/location/>
            PREFIX uco-core: <https://ontology.unifiedcyberontology.org/uco/core/>

            SELECT ?lStreet
            WHERE {
                ?nLocation a uco-location:Location .
                ?nLocation uco-core:hasFacet ?nSimpleAddressFacet .
                ?nSimpleAddressFacet a uco-location:SimpleAddressFacet .
                ?nSimpleAddressFacet uco-location:street ?lStreet .
            }
            """;

var queryString = new SparqlParameterizedString
{
    CommandText = query
};
// Define the namespaces used in the query
queryString.Namespaces.AddNamespace("uco-core", new Uri("https://ontology.unifiedcyberontology.org/uco/core/"));
queryString.Namespaces.AddNamespace("uco-location", new Uri("https://ontology.unifiedcyberontology.org/uco/location/"));

// Execute the query
var results = (SparqlResultSet) queryProcessor.ProcessQuery(parser.ParseFromString(queryString));

// Print the results to the console
foreach (var result in results)
{
    Console.WriteLine(result["lStreet"]);
}
```

{% endtab %}

{% tab log Java %}

```java
// Depends on org.apache.jena (https://mvnrepository.com/artifact/org.apache.jena/jena-arq)
import org.apache.jena.query.*;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.riot.RDFDataMgr;
import org.apache.jena.riot.Lang;

public class CASEQuery {
    public static void main(String[] args) {
        // Load the graph from the JSON-LD file
        Model model = RDFDataMgr.loadModel("case.jsonld", Lang.JSONLD);

        // Define the SPARQL query
        String queryString = """
            PREFIX uco-location: <https://ontology.unifiedcyberontology.org/uco/location/>
            PREFIX uco-core: <https://ontology.unifiedcyberontology.org/uco/core/>

            SELECT ?lStreet
            WHERE {
                ?nLocation a uco-location:Location .
                ?nLocation uco-core:hasFacet ?nSimpleAddressFacet .
                ?nSimpleAddressFacet a uco-location:SimpleAddressFacet .
                ?nSimpleAddressFacet uco-location:street ?lStreet .
            }
        """;

        // Create the query
        Query query = QueryFactory.create(queryString);

        // Execute the query and obtain results
        try (QueryExecution qexec = QueryExecutionFactory.create(query, model)) {
            ResultSet results = qexec.execSelect();

            // Print the results to the console
            while (results.hasNext()) {
                QuerySolution soln = results.nextSolution();
                System.out.println(soln.getLiteral("lStreet").getString());
            }
        }
    }
}
```

{% endtab %}

{% endtabs %}

A full set of examples for querying CASE graphs and converting them to a GeoJSON output format in several programming languages is available in the [CASE-Examples-Conversion](https://github.com/casework/CASE-Examples-Conversion) repository.
