---
<!-- layout: releases -->
title: Hardware Duplicator
jumbo_desc: Logicube Falcon Report Example
---

## Forensic Duplication of Storage Media

This example represents the audit log output by a hardware duplicator (Logicube Falcon) used to create a forensic image of a hard drive. This data is from a fictitious multi-part investigation developed as part of the EVIDENCE2-eCODEX project.

The The JSON-LD data on this page are available combined in the file [hardware_duplicator.json](hardware_duplicator.json).

### CASE INVESTIGATION CONTEXT
The first part of representing information in CASE is to provide the context, including the header map (CASE/UCO IRIs), investigation details, those involved, and tool(s) used. 

{% highlight json %}
{
  "@context":{
    "kb": "http://example.org/kb/",
    "@vocab": "http://example.org/ontology/local#",
    "case-investigation": "https://caseontology.org/ontology/case/investigation#",
    "rdf": "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "uco-action": "https://unifiedcyberontology.org/ontology/uco/action#",
    "uco-core": "https://unifiedcyberontology.org/ontology/uco/core#",
    "uco-identity": "https://unifiedcyberontology.org/ontology/uco/identity#",
    "uco-location": "https://unifiedcyberontology.org/ontology/uco/location#",
    "uco-observable": "https://unifiedcyberontology.org/ontology/uco/observable#",
    "uco-tool": "https://unifiedcyberontology.org/ontology/uco/tool#",
    "uco-types": "https://unifiedcyberontology.org/ontology/uco/types#",
    "uco-vocabulary": "https://unifiedcyberontology.org/ontology/uco/vocabulary#",
    "xsd": "http://www.w3.org/2001/XMLSchema#"  
  },
  "@id":"kb:Bundle-5db141fc-597b-4771-bea5-b9605292d2ed",
  "@type":"uco-case:Bundle",
  "uco-core:description":"HARD DISK DA 1TB CONTENUTO NEL PC MARCA ACER DENOMINATO R14_ACER",
  "uco-core:object":[
{
      "@id":"kb:Investigation-e2c24473-63fa-4122-83ee-868325bdd5e8",
      "@type":"case-investigation:Investigation",
      "uco-core:name":"PP 1234_18_21",
      "uco-core:focus":"Child solicitation",
      "uco-core:description":"Hard drive acquired as evidence.",
      "uco-core:object":[list uuids in investigation]
},
{
   "@id":"kb:Identity-c5bb09c3-3612-4bf2-b165-6f12d0e3c6af",
   "@type":"uco-identity:Identity",
   "uco-core:hasFacet":[
   {
      "@type":"uco-identity:Organisation",
      "uco-drafting:orgName":"REALITY NET"
   }
   ]
},
{
   "@id":"kb:Role-856975ce-3c25-49c3-b6eb-28d1e929f915", 
   "@type":"uco-core:Role",
   "uco-core:name":"Forensic Expert"
},
{
   "@id":"kb:Relationship-d5b4a1e1-0e25-4257-81f7-19febc86ded1", 
   "@type":"uco-core:Relationship",
   "uco-core:source":"kb:Identity-c5bb09c3-3612-4bf2-b165-6f12d0e3c6af",
   "uco-core:target":"kb:Role-856975ce-3c25-49c3-b6eb-28d1e929f915",
   "uco-core:kindOfRelationship":"Has_Role",
   "uco-core:isDirectional":"True"
},
{
   "@id":"kb:ConfiguredTool-58f07c30-ae20-4587-9bb8-1a5299821e57", 
   "@type":"uco-tool:ConfiguredTool", 
   "uco-core:name":"Logicube",
   "uco-tool:toolType":"acquisition/duplication", 
   "uco-tool:creator":"Falcon", 
   "uco-tool:version":"3.2u1",
   "uco-tool_NOT_EXISTS:toolIdentifier":"134090",
   "uco-configuration:usesConfiguration": {
            "@id": "kb:Configuration-2afbfbb1-b4d6-4ad5-9691-ff09b9f6eebe",
            "@type": "uco-configuration:Configuration",
            "uco-configuration:configurationEntry": [
                {
                    "@type": "uco-configuration:ConfigurationEntry",
                    "uco-configuration:itemName": "Mode",
                    "uco-configuration:itemValue": "DriveToFile"
                },
                {
                    "@type": "uco-configuration:ConfigurationEntry",
                    "uco-configuration:itemName": "Method",
                    "uco-configuration:itemValue": "E01Capture"
                },
                {
                    "@type": "uco-configuration:ConfigurationEntry",
                    "uco-configuration:itemName": "Hash",
                    "uco-configuration:itemValue": "SHA-1+MD5"
                },
                {
                    "@type": "uco-configuration:ConfigurationEntry",
                    "uco-configuration:itemName": "SegmentSize",
                    "uco-configuration:itemValue": "4GB"
                }
            ]
        }
},
{% endhighlight %}

NOTE: Update Configuration settings to relationship


### EVIDENTIAL ITEM
Representing the hard drive being acquired and its provenance record.

{% highlight json %}
{
   "@id":"kb:Disk-e598c1b3-f76d-4c27-b592-49bfdbf23d11", 
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
      {
         "@type":"uco-observable:DiskFacet",
         "uco-observable:model":"TOSHIBA_MQ01ABD100",
         "uco-observable:serialNumber":"Z612S32MS",
         "uco-observable:capacity":"1000204886016"
      },
      {
      "@type": "uco-observable:ContentDataFacet",
      "uco-observable:hash": [
        {
          "@type": "uco-observable:Hash",
          "uco-types:hashMethod": {
            "@type": "uco-vocabulary:HashNameVocab",
            "@value": "MD5"
          },
          "uco-types:hashValue": {
            "@type": "xsd:hexBinary",
            "@value": "dc5a1388b16da810bcb8e524c9b4f549"
          }
        },
        {
          "@type": "uco-observable:Hash",
          "uco-types:hashMethod": {
            "@type": "uco-vocabulary:HashNameVocab",
            "@value": "SHA1"
          },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "4196297e15b9190b8770fb51a8408d71d6728454"
            }
          }
        ]
      }
   ]
},
{
   "@id":"kb:ProvenanceRecord-43f26e68-b02f-410b-a917-506c70b732e6",
   "@type":"case-investigation:ProvenanceRecord",
   "uco-observable:createdTime":{
     "@type": "xsd:dateTime",
     "@value": "2018-10-26T13:12:48.00Z"
   }, 
   "uco-core:description":"HD TOSHIBA_MQ01ABD100", 
   "case-investigation:exhibitNumber":"R14_ACER_HD", 
   "uco-core:object":["kb:disk-e598c1b3-f76d-4c27-b592-49bfdbf23d11"]
},
{% endhighlight %}


### PARTITION STRUCTURE
Representing the partition structure of the evidential hard drive as reported by the Logicube Falcon.


{% highlight json %}
{
   "@id":"kb:DiskPartition-6f643033-9a10-4519-af98-a0902690b9a9", 
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"DiskPartitionFacet",
      "uco-observable:diskPartitionType":"FAT32",
      "uco-observable:partitionID":"1",
      "uco-observable:partitionOffset":"1048576",
      "uco-observable:partitionLength":"104857600"
   }
   ]
},
{
   "@id":"kb:Relationship-52aa42a6-8d79-450d-9236-bc76d67840ec", 
   "@type":"uco-core:Relationship",
   "uco-core:source":"kb:DiskPartition-6f643033-9a10-4519-af98-a0902690b9a9",
   "uco-core:target":"kb:Disk-e598c1b3-f76d-4c27-b592-49bfdbf23d11",
   "uco-core:kindOfRelationship":"Contained_Within",
   "uco-core:isDirectional":"True"
},
{
   "@id":"kb:DiskPartition-820d247d-3016-49a0-82ca-705dc9b70254", 
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"DiskPartitionFacet",
      "uco-observable:diskPartitionType":"unknown",
      "uco-observable:partitionID":"2",
      "uco-observable:partitionOffset":"105906176",
      "uco-observable:partitionLength":"16777216"
   }
   ]
},
{
   "@id":"kb:Relationship-fb44d09e-2ada-44e8-9c2e-70fe71202652", 
   "@type":"uco-core:Relationship",
   "uco-core:source":"kb:DiskPartition-820d247d-3016-49a0-82ca-705dc9b70254",
   "uco-core:target":"kb:Disk-e598c1b3-f76d-4c27-b592-49bfdbf23d11",
   "uco-core:kindOfRelationship":"Contained_Within",
   "uco-core:isDirectional":"True"
},
{
   "@id":"kb:DiskPartition-e19c38f5-692b-4336-8d6d-fdc34a51b00e", 
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"DiskPartitionFacet",
      "uco-observable:diskPartitionType":"ntfs",
      "uco-observable:partitionID":"3",
      "uco-observable:partitionOffset":"122683392",
      "uco-observable:partitionLength":"505077039104"
   }
   ]
},
{
   "@id":"kb:Relationship-c34de1cd-daa3-4381-a4c6-7a05005cb3d3", 
   "@type":"uco-core:Relationship",
   "uco-core:source":"kb:DiskPartition-e19c38f5-692b-4336-8d6d-fdc34a51b00e",
   "uco-core:target":"kb:Disk-e598c1b3-f76d-4c27-b592-49bfdbf23d11",
   "uco-core:kindOfRelationship":"Contained_Within",
   "uco-core:isDirectional":"True"
},
{
   "@id":"kb:DiskPartition-a193840c-7b8b-4ede-a5a7-e4464b30b9c7", 
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"DiskPartitionFacet",
      "uco-observable:diskPartitionType":"ntfs",
      "uco-observable:partitionID":"4",
      "uco-observable:partitionOffset":"505199722496",
      "uco-observable:partitionLength":"493928579072"
   }
   ]
},
{
   "@id":"kb:Relationship-d348200b-e180-40b8-8617-2319f5fe6ffa", 
   "@type":"uco-core:Relationship",
   "uco-core:source":"kb:DiskPartition-a193840c-7b8b-4ede-a5a7-e4464b30b9c7",
   "uco-core:target":"kb:Disk-e598c1b3-f76d-4c27-b592-49bfdbf23d11",
   "uco-core:kindOfRelationship":"Contained_Within",
   "uco-core:isDirectional":"True"
},
{
   "@id":"kb:DiskPartition-f90a3ee1-2cde-439f-9768-23c67aafe347", 
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"DiskPartitionFacet",
      "uco-observable:diskPartitionType":"ntfs",
      "uco-observable:partitionID":"5",
      "uco-observable:partitionOffset":"999129350144",
      "uco-observable:partitionLength":"1073741824"
   }
   ]
},
{
   "@id":"kb:Relationship-ff010f40-7f95-498a-9cde-14fa8de501b9", 
   "@type":"uco-core:Relationship",
   "uco-core:source":"kb:DiskPartition-f90a3ee1-2cde-439f-9768-23c67aafe347",
   "uco-core:target":"kb:Disk-e598c1b3-f76d-4c27-b592-49bfdbf23d11",
   "uco-core:kindOfRelationship":"Contained_Within",
   "uco-core:isDirectional":"True"
},
{% endhighlight %}

### INVESTIGATIVE ACTION
Representing the action to perform the forensic acquisition using the Logicube Falcon hardware duplicator.


{% highlight json %}
{
   "@id":"kb:InvestigativeAction-414ef4e5-0a1f-43d9-9e93-002bc2a28de4",
   "@type":"case-investigation:InvestigativeAction",
   "uco-core:name":"acquired",
   "uco-core:description":"Acquisition of TOSHIBA_MQ01ABD100",
   "uco-action:startTime":{
     "@type": "xsd:dateTime",
     "@value": "2018-10-26T13:12:48.00Z"
   }, 
   "uco-action:endTime":{
     "@type": "xsd:dateTime",
     "@value": "2018-10-26T16:31:50.00Z"
   },
   "uco-core:hasFacet":[   
   {
      "@type":"uco-action:ActionReferences",
      "uco-action:instrument":"kb:ConfiguredTool-58f07c30-ae20-4587-9bb8-1a5299821e57",
      "uco-action:location":"NOT PROVIDED BY XML REPORT",
      "uco-action:performer":"kb:Role-856975ce-3c25-49c3-b6eb-28d1e929f915",
      "uco-action:object":["kb:Disk-e598c1b3-f76d-4c27-b592-49bfdbf23d11"],
      "uco-action:result":[
           "kb:ProvenanceRecord-d1828cbb-bb0f-42e3-b021-cfd9d6419ae6"
           "kb:File-3366d44d-4e46-43a3-9df6-20aaff011d16", 
           "kb:File-e8b28291-ca89-4199-b30d-d1d180619077",
           "kb:File-3a3fffe1-630f-4f2c-a1a3-d7d4ee0d632e",
           "kb:File-9d5d0b5d-73cb-4eac-8123-dba4d177ba78",
           "kb:File-ead689c2-26d4-4268-b4dd-d7936221f1ac",
           "kb:File-1616af98-d178-45ba-adb6-e45ba004b7be",
           "kb:File-9c08fdb3-36f6-4438-9da1-9d5eef691283",
           "kb:File-49457498-305a-42e8-b5a4-54559940b3ef",
           "kb:File-b4e0f188-26d0-4c94-b7f4-e3dd92df2321",
           "kb:File-697cab05-bd2a-4c41-87f4-c279b0fd9089",
           "kb:File-ea3a8789-fd83-4768-ad72-aed2ebf7ee67",
           "kb:File-c0c296e6-d143-4af0-bec4-81e3b62d70f6",
           "kb:File-7b828acc-1e0a-4215-b847-5f79869791ed",
           "kb:File-05f2d0ad-1fb0-4015-8805-5cf2b17574de",
           "kb:File-2377b497-02fa-4010-b00d-545a682b5022",
           "kb:File-61cf1397-159e-4b45-99c4-4c3eb78a500d",
           "kb:File-6d3551e3-c707-49d9-a17c-c297de884995",
           "kb:File-c5a93f7d-2482-4752-b8f1-491d8584496a",
           "kb:File-14ca15b8-020c-449e-9206-7c66c92a7663",
           "kb:File-24d16a25-55dd-46e2-8114-590b4ca01ab7",
           "kb:File-9322e5d1-175e-4b27-b750-f3d3ef16b601",
           "kb:File-1c0fcc09-a413-4cbf-8d6b-ff1fcff1b28c",
           "kb:File-795ce33b-87ec-43c4-b7d6-fa656e77c407",
           "kb:File-6422b2db-8e83-4635-bda3-21ef3f7f571e",
           "kb:File-a672b9b3-2b00-49f3-bff1-997ec5c4d1a0",
           "kb:File-cefde0b9-201d-424c-86cb-866253a089f7",
           "kb:File-2e5c740c-1948-48f5-a7dc-2dc58071efc6",
           "kb:File-73891986-60af-47f9-a7c6-c2bd0b749754",
           "kb:File-eff98353-779f-455c-828a-0c5a31a83b89",
           "kb:File-37eb9103-46af-4b60-93a6-6169f8cd0767",
           "kb:File-fb00a9cd-17e1-438f-9b28-ca5d7149f9c7",
           "kb:File-7fbb2a37-b524-41da-843c-512c757f9a53",
           "kb:File-339d008c-9a91-4db8-a0fd-772e0824f7a3",
           "kb:File-3781b13c-4814-4884-ad9e-f7c8a5912a77",
           "kb:File-f1980292-3045-445f-a0e4-f6f89a60835f",
           "kb:File-f8896dfb-6d42-4962-bb9b-84c0eb998da7",
           "kb:File-1908407e-ddde-4524-9f23-81ff37b4daf9",
           "kb:File-42533fb7-0cb4-4016-bb0d-d1e13846eca1"
      ]
    }
  ]
},
{
   "@id":"kb:ProvenanceRecord-d1828cbb-bb0f-42e3-b021-cfd9d6419ae6",
   "@type":"case-investigation:ProvenanceRecord",
   "uco-core:description":"Segment files (38) partitions with E01Capture",
   "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"
   },  
   "case-investigation:exhibitNumber":"NOT PROVIDED BY XML REPORT", 
   "uco-core:object":["
           "kb:File-3366d44d-4e46-43a3-9df6-20aaff011d16",
           "kb:File-e8b28291-ca89-4199-b30d-d1d180619077",
           "kb:File-3a3fffe1-630f-4f2c-a1a3-d7d4ee0d632e",
           "kb:File-9d5d0b5d-73cb-4eac-8123-dba4d177ba78",
           "kb:File-ead689c2-26d4-4268-b4dd-d7936221f1ac",
           "kb:File-1616af98-d178-45ba-adb6-e45ba004b7be",
           "kb:File-9c08fdb3-36f6-4438-9da1-9d5eef691283",
           "kb:File-49457498-305a-42e8-b5a4-54559940b3ef",
           "kb:File-b4e0f188-26d0-4c94-b7f4-e3dd92df2321",
           "kb:File-697cab05-bd2a-4c41-87f4-c279b0fd9089",
           "kb:File-ea3a8789-fd83-4768-ad72-aed2ebf7ee67",
           "kb:File-c0c296e6-d143-4af0-bec4-81e3b62d70f6",
           "kb:File-7b828acc-1e0a-4215-b847-5f79869791ed",
           "kb:File-05f2d0ad-1fb0-4015-8805-5cf2b17574de",
           "kb:File-2377b497-02fa-4010-b00d-545a682b5022",
           "kb:File-61cf1397-159e-4b45-99c4-4c3eb78a500d",
           "kb:File-6d3551e3-c707-49d9-a17c-c297de884995",
           "kb:File-c5a93f7d-2482-4752-b8f1-491d8584496a",
           "kb:File-14ca15b8-020c-449e-9206-7c66c92a7663",
           "kb:File-24d16a25-55dd-46e2-8114-590b4ca01ab7",
           "kb:File-9322e5d1-175e-4b27-b750-f3d3ef16b601",
           "kb:File-1c0fcc09-a413-4cbf-8d6b-ff1fcff1b28c",
           "kb:File-795ce33b-87ec-43c4-b7d6-fa656e77c407",
           "kb:File-6422b2db-8e83-4635-bda3-21ef3f7f571e",
           "kb:File-a672b9b3-2b00-49f3-bff1-997ec5c4d1a0",
           "kb:File-cefde0b9-201d-424c-86cb-866253a089f7",
           "kb:File-2e5c740c-1948-48f5-a7dc-2dc58071efc6",
           "kb:File-73891986-60af-47f9-a7c6-c2bd0b749754",
           "kb:File-eff98353-779f-455c-828a-0c5a31a83b89",
           "kb:File-37eb9103-46af-4b60-93a6-6169f8cd0767",
           "kb:File-fb00a9cd-17e1-438f-9b28-ca5d7149f9c7",
           "kb:File-7fbb2a37-b524-41da-843c-512c757f9a53",
           "kb:File-339d008c-9a91-4db8-a0fd-772e0824f7a3",
           "kb:File-3781b13c-4814-4884-ad9e-f7c8a5912a77",
           "kb:File-f1980292-3045-445f-a0e4-f6f89a60835f",
           "kb:File-f8896dfb-6d42-4962-bb9b-84c0eb998da7",
           "kb:File-1908407e-ddde-4524-9f23-81ff37b4daf9",
           "kb:File-42533fb7-0cb4-4016-bb0d-d1e13846eca1"
   ]
},
{% endhighlight %}

NOTE: Destination drive properties where output was saved as Serial Number = "Z50503SC" and Destination UID="SAS_D1/5C1C79AB3F137696"

### FORENSIC ACQUISITION RESULTS
Representing file segments of acquired forensic acquisition.

{% highlight json %}
{
   "@id":"kb:File-3366d44d-4e46-43a3-9df6-20aaff011d16", 
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E01",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E01",
      "uco-observable:extension":"E01",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {  
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          { 
            "@type": "uco-observable:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "3f9006a2d3130c4845678bdb6824dbac2b12c9c8"
            }
         }
       ]
     }
   ]
},
{
   "@id":"kb:File-e8b28291-ca89-4199-b30d-d1d180619077",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
    {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E02",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E02",
      "uco-observable:extension":"E02",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "fd56f96a0c58eda0444ca7acfa85e9bea4093a59"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-3a3fffe1-630f-4f2c-a1a3-d7d4ee0d632e",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E03",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E03",
      "uco-observable:extension":"E03",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "91721ead5b3f0179473e4b8b724f13b9564c779c"
            }
         }
        ] 
      }
   ]
},
{
   "@id":"kb:File-9d5d0b5d-73cb-4eac-8123-dba4d177ba78",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E04",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E04",
      "uco-observable:extension":"E04",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "89f64fe23f7b03442fe21eed10bdc4196b2e665b"
            }
         }
       ]
      }
   ]
},
{
   "@id":"kb:File-ead689c2-26d4-4268-b4dd-d7936221f1ac",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E05",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E05",
      "uco-observable:extension":"E05",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "b05c8001c9ecf8f3406c0be578989130ed57f63d"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-1616af98-d178-45ba-adb6-e45ba004b7be",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E06",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E06",
      "uco-observable:extension":"E06",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "284c2ee098c699fc64c23a4ad76814d5002cf6a7"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-9c08fdb3-36f6-4438-9da1-9d5eef691283",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E07",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E07",
      "uco-observable:extension":"E07",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "34a95a0bd04d3a329ea272a249122ab1bbd871fb"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-49457498-305a-42e8-b5a4-54559940b3ef",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E08",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E08",
      "uco-observable:extension":"E08",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "ad575817855d5f217bfd1f8d677b89a52d32a77e"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-b4e0f188-26d0-4c94-b7f4-e3dd92df2321",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E09",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E09",
      "uco-observable:extension":"E09",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "57ff2394d71ef568bcde02e204b9f1dbdb403250"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-697cab05-bd2a-4c41-87f4-c279b0fd9089",
   "@type":"uco-observable:ObservableObject",
   "":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E10",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E10",
      "uco-observable:extension":"E10",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "ec6e362796888fe28a4e66c7f3f608a00039a902"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-ea3a8789-fd83-4768-ad72-aed2ebf7ee67",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E11",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E11",
      "uco-observable:extension":"E11",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "ffb03762947211ed3e395fb571eeacd3214fc63b"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-c0c296e6-d143-4af0-bec4-81e3b62d70f6",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E12",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E12",
      "uco-observable:extension":"E12",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "885f1f3ecb58a081e22a0ff475340ce36836edbf"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-7b828acc-1e0a-4215-b847-5f79869791ed",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E13",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E13",
      "uco-observable:extension":"E13",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "3309dfbabf425e8eda61c55ecaca74d3b0a20a93"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-05f2d0ad-1fb0-4015-8805-5cf2b17574de",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E14",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E14",
      "uco-observable:extension":"E14",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "82e6e5a7036eb791405525de1018851bc211e11f"
            }
         }
       ]
      }
   ]
},
{
   "@id":"kb:File-2377b497-02fa-4010-b00d-545a682b5022",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E15",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E15",
      "uco-observable:extension":"E15",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "c0324777a8895014bed7e6842307682299a7f828"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-61cf1397-159e-4b45-99c4-4c3eb78a500d",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E16",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E16",
      "uco-observable:extension":"E16",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "92880af1cdacfd65be0807ddc8ffe6181bc06e89"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-6d3551e3-c707-49d9-a17c-c297de884995",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E17",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E17",
      "uco-observable:extension":"E17",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-types:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "4d175e0921adb8311aa367ce6475c71228ef37cb"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-c5a93f7d-2482-4752-b8f1-491d8584496a",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E18",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E18",
      "uco-observable:extension":"E18",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
            "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "1495f4d71191b68e0b27fc5a204cd25201a77091"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-14ca15b8-020c-449e-9206-7c66c92a7663",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E19",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E19",
      "uco-observable:extension":"E19",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "7777970eb1a5b89e9b78c4dd438250def5ddb9cd"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-24d16a25-55dd-46e2-8114-590b4ca01ab7",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E20",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E20",
      "uco-observable:extension":"E20",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "7122572ec9ee8ebd9d202548d51eff08f0bd28ec"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-9322e5d1-175e-4b27-b750-f3d3ef16b601",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E21",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E21",
      "uco-observable:extension":"E21",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "3d4883db867d3c4ad5f9ed3a0f9b903502c40561"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-1c0fcc09-a413-4cbf-8d6b-ff1fcff1b28c",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E22",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E22",
      "uco-observable:extension":"E22",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "11c2c9e940859133d1928dd5f9483e430bfe9991"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-795ce33b-87ec-43c4-b7d6-fa656e77c407",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E23",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E23",
      "uco-observable:extension":"E23",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "6e86c0bc7ef7ff0239be4013287e91c19aa9a682"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-6422b2db-8e83-4635-bda3-21ef3f7f571e",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E24",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E24",
      "uco-observable:extension":"E24",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "df801f9b8692940f5fb97d644051f275885466c5"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-a672b9b3-2b00-49f3-bff1-997ec5c4d1a0",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E25",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E25",
      "uco-observable:extension":"E25",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "8d304a07ca584dc291a6cd70b173af97925277da"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-cefde0b9-201d-424c-86cb-866253a089f7",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E26",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E26",
      "uco-observable:extension":"E26",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "e94f126c7014d14a3e78bcfd0a484ee2a43ccbd0"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-2e5c740c-1948-48f5-a7dc-2dc58071efc6",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E27",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E27",
      "uco-observable:extension":"E27",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "531f94930334f70119ed972ba2d20f29411dfb3b"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-73891986-60af-47f9-a7c6-c2bd0b749754",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E28",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E28",
      "uco-observable:extension":"E28",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "hash":[
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "bb13c8cc5f0a3e89d3f6180c0b09fcbecac658a2"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-eff98353-779f-455c-828a-0c5a31a83b89",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E29",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E29",
      "uco-observable:extension":"E29",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
       "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "0de8a33ee74454068ead698c05eedc7196e5c0d1"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-37eb9103-46af-4b60-93a6-6169f8cd0767",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E30",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E30",
      "uco-observable:extension":"E30",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "81431e9f98571f45ff1af1978c5957573ea42676"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-fb00a9cd-17e1-438f-9b28-ca5d7149f9c7",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E31",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E31",
      "uco-observable:extension":"E31",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "db97a86aeaa1b8d3e8c913359e6917bda7d399d3"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-7fbb2a37-b524-41da-843c-512c757f9a53",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E32",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E32",
      "uco-observable:extension":"E32",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "0930bf04218e54fbcb2e8c065903a721272679c9"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-339d008c-9a91-4db8-a0fd-772e0824f7a3",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E33",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E33",
      "uco-observable:extension":"E33",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "8504d05670f078fcd3060e174c550d223477a11e"
            }
         }
        ]
      }
   ]   
},
{
   "@id":"kb:File-3781b13c-4814-4884-ad9e-f7c8a5912a77",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E34",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E34",
      "uco-observable:extension":"E34",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "1c718a79ef8e137326dee872c6778445f9d92173"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-f1980292-3045-445f-a0e4-f6f89a60835f",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E35",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E35",
      "uco-observable:extension":"E35",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "77dfb7e832582c62ad06f0e5366238507f9fe0da"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-f8896dfb-6d42-4962-bb9b-84c0eb998da7",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E36",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E36",
      "uco-observable:extension":"E36",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "4bd27e99eca38f629debbeee150b3f7dd034037b"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-1908407e-ddde-4524-9f23-81ff37b4daf9",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E37",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E37",
      "uco-observable:extension":"E37",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "8b4037c10e3c3b50a183fd396c68dffdc0fa8217"
            }
         }
        ]
      }
   ]
},
{
   "@id":"kb:File-42533fb7-0cb4-4016-bb0d-d1e13846eca1",
   "@type":"uco-observable:ObservableObject",
   "uco-core:hasFacet":[
   {
      "@type":"uco-observable:FileFacet",
      "uco-observable:fileName":"R14_ACER_HD.E38",
      "uco-observable:filePath":"/var/repo/sas-d1/R14_ACER_HD.E38",
      "uco-observable:extension":"E38",
      "uco-observable:fileSystemType":"ntfs",
      "uco-observable:isDirectory":"false",
      "uco-observable:sizeInBytes":"4GB",
      "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
      },
      {
         "type":"uco-observable:ContentDataFacet",
         "uco-observable:hash": [
          {
            "@type": "uco-observable:Hash",
         "uco-types:hashMethod": {
              "@type": "uco-vocabulary:HashNameVocab",
              "@value": "SHA1"
            },
            "uco-types:hashValue": {
              "@type": "xsd:hexBinary",
              "@value": "47001faf6ae8d73e3a47df33c260be6bcc47b2d0"
            }
         }
        ]
      }
   ]
}
{% endhighlight %}

### Disclaimers

Participation by contributors in the creation of the documentation of mentioned software is not intended to imply a recommendation or endorsement by the United States Government nor any of the contributors' employers, nor is it intended to imply that any specific software is necessarily the best available for the purpose.

Events, locations, tools, and people represented in this and other CASE narratives are presented, and at many times created, for illustration purposes only and do not necessarily represent real events, locations, tools, or people.
