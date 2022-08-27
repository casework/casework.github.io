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
  "@id":":bundle-3578FCF3-6BC8-4996-8F7F-FDF289F33789",
  "@type":"uco-case:Bundle",
  "uco-core:description":"HARD DISK DA 1TB CONTENUTO NEL PC MARCA ACER DENOMINATO R14_ACER",
  "uco-core:object":[
{
      "@id":":investigation-15785FBB-BA09-449D-AF77-8A210D013789",
      "@type":"case-investigation:Investigation",
      "uco-core:name":"PP 1234_18_21",
      "uco-core:focus":"Child solicitation",
      "uco-core:description":"Hard drive acquired as evidence.",
      "uco-core:object":[list uuids in investigation]
},
{
   "@id":"{A4B0AAF7-82AB-411C-944F-1FA955DD9B22}",
   "@type":"uco-identity:Identity",
   "uco-core:hasFacet":[
   {
      "@type":"uco-identity:Organisation",
      "uco-drafting:orgName":"REALITY NET"
   }
   ]
},
{
   "@id":"{37C48C5E-72A8-4B22-BBB8-02E7CB7B9335}", 
   "@type":"uco-core:Role",
   "uco-core:name":"Forensic Expert"
},
{
   "@id":"{D045621F-B5AC-4B87-9242-241600C98769}", 
   "@type":"uco-core:Relationship",
   "uco-core:source":"{A4B0AAF7-82AB-411C-944F-1FA955DD9B22}",
   "uco-core:target":"{37C48C5E-72A8-4B22-BBB8-02E7CB7B9335}",
   "uco-core:kindOfRelationship":"has_role",
   "uco-core:isDirectional":"True"
},
{
   "@id":"{7D016261-D192-4A7F-8BEE-F9388224BA77}", 
   "@type":"uco-tool:Tool", 
   "uco-core:name":"Logicube",
   "uco-tool:toolType":"acquisition/duplication", 
   "uco-tool:creator":"Falcon", 
   "uco-tool:version":"3.2u1",
   "uco-tool_NOT_EXISTS:toolIdentifier":"134090",
   "uco-core:hasFacet":[
   {
   "@type":"uco-tool:ToolConfigurationType",
   "uco-tool:configurationSetting":[
   {
      "@type":"uco-tool:ConfigurationSettingType",
      "uco-tool:itemName":"Mode",
      "uco-tool:itemValue":"DriveToFile"
   },
   {
      "@type":"uco-tool:ConfigurationSettingType",
      "uco-tool:itemName":"Method",
      "uco-tool:itemValue":"E01Capture"
   },
   {
      "@type":"uco-tool:ConfigurationSettingType",
      "uco-tool:itemName":"Hash",
      "uco-tool:itemValue":"SHA-1+MD5"
   },
   {
      "@type":"uco-tool:ConfigurationSettingType",
      "uco-tool:itemName":"SegmentSize",
      "uco-tool:itemValue":"4GB"
      }
      ]
   }
  ]
},
{% endhighlight %}

NOTE: Update Configuration settings to relationship


### EVIDENTIAL ITEM
Representing the hard drive being acquired and its provenance record.

{% highlight json %}
{
   "@id":"{DFEC45DF-DAB9-4FED-9A07-FFA77A0DA824}", 
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
        }
    ],
},
{
   "@id":"{A2C1CA50-704B-4BF8-BA50-49935D83C59E}",
   "@type":"case-investigation:ProvenanceRecord",
   "uco-observable:createdTime":{
     "@type": "xsd:dateTime",
     "@value": "2018-10-26T13:12:48.00Z"
   }, 
   "uco-core:description":"HD TOSHIBA_MQ01ABD100", 
   "case-investigation:exhibitNumber":"R14_ACER_HD", 
   "uco-core:object":["{DFEC45DF-DAB9-4FED-9A07-FFA77A0DA824}"]
},
{% endhighlight %}


### PARTITION STRUCTURE
Representing the partition structure of the evidential hard drive as reported by the Logicube Falcon.


{% highlight json %}
{
   "@id":"{50C800D0-F90E-488D-ADBD-B3FCE500B2BF}", 
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
   "@id":"{E3C5F778-10A5-4F1A-B4F3-F656CB85CF66}", 
   "@type":"uco-core:Relationship",
   "uco-core:source":"{50C800D0-F90E-488D-ADBD-B3FCE500B2BF}",
   "uco-core:target":"{DFEC45DF-DAB9-4FED-9A07-FFA77A0DA824}",
   "uco-core:kindOfRelationship":"contained_within",
   "uco-core:isDirectional":"True"
},
{
   "@id":"{62CCDE4A-7316-4C62-BCB6-2F56C5A21B9A}", 
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
   "@id":"{59F60C73-1C3F-4B1B-8D5F-A192C6267EE0}", 
   "@type":"uco-core:Relationship",
   "uco-core:source":"{62CCDE4A-7316-4C62-BCB6-2F56C5A21B9A}",
   "uco-core:target":"{DFEC45DF-DAB9-4FED-9A07-FFA77A0DA824}",
   "uco-core:kindOfRelationship":"contained_within",
   "uco-core:isDirectional":"True"
},
{
   "@id":"{8D4AA272-7879-47D0-BA9E-8E36AB528431}", 
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
   "@id":"{244D4629-15E7-4281-BB06-0B0BC79C2993}", 
   "@type":"uco-core:Relationship",
   "uco-core:source":"{8D4AA272-7879-47D0-BA9E-8E36AB528431}",
   "uco-core:target":"{DFEC45DF-DAB9-4FED-9A07-FFA77A0DA824}",
   "uco-core:kindOfRelationship":"contained_within",
   "uco-core:isDirectional":"True"
},
{
   "@id":"{0EC88A6B-104C-47D9-81A8-D5DC403D0BA1}", 
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
   "@id":"{2AC9DD8C-79D8-4C08-9F46-D24299136F46}", 
   "@type":"uco-core:Relationship",
   "uco-core:source":"{0EC88A6B-104C-47D9-81A8-D5DC403D0BA1}",
   "uco-core:target":"{DFEC45DF-DAB9-4FED-9A07-FFA77A0DA824}",
   "uco-core:kindOfRelationship":"contained_within",
   "uco-core:isDirectional":"True"
},
{
   "@id":"{BC47A595-C74F-48B5-974C-6415E5A38C7F}", 
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
   "@id":"{96D4721F-3DC3-498A-B6EE-B463B50EEBF0}", 
   "@type":"uco-core:Relationship",
   "uco-core:source":"{BC47A595-C74F-48B5-974C-6415E5A38C7F}",
   "uco-core:target":"{DFEC45DF-DAB9-4FED-9A07-FFA77A0DA824}",
   "uco-core:kindOfRelationship":"contained_within",
   "uco-core:isDirectional":"True"
},
{% endhighlight %}

### INVESTIGATIVE ACTION
Representing the action to perform the forensic acquisition using the Logicube Falcon hardware duplicator.


{% highlight json %}
{
   "@id":"{492A7400-6B08-4D68-A520-9AB32C6DA043}",
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
      "uco-action:instrument":"{A4B0AAF7-82AB-411C-944F-1FA955DD9B22}",
      "uco-action:location":"NOT PROVIDED BY XML REPORT",
      "uco-action:performer":"{37C48C5E-72A8-4B22-BBB8-02E7CB7B9335}",
      "uco-action:object":["{DFEC45DF-DAB9-4FED-9A07-FFA77A0DA824}"],
      "uco-action:result":["{9240F851-0E2A-4016-BACF-02AFB3DDAB74}", 
        "{76087322-932D-4A64-B5C7-9FD4F4835386}", "{9E6B8C9D-5686-4CA8-A00C-05CA4107170E}", 
        "{CC6A7682-B6F3-4F14-9C94-DB6104A5EF8A}", "{C3D99EAD-F4C2-4EA1-AA95-A4578786CB7C}",
        "{ECC522D5-F0CE-4BAE-B4D2-05D192F2104D}", "{2A60ACC3-1C37-4831-B0AA-784F27B2ACA7}",
        "{1CFB3C01-9EB9-4209-946D-A6A9D24302B1}", "{9203DB1A-FB25-4FDD-BD42-0EEC0BD4D218}",
        "{DAB4363B-14FF-4852-B8F6-A1729DB4EF8C}", "{E916BECF-474E-4ABE-92B8-21332E4E7524}", 
        "{F58917F7-9E14-43DF-86B6-3AE0501CF1F7}", "{242F4AD9-729F-4A7E-9672-1ED06EDF7BE0}",
        "{725F48DC-AD3F-4FF0-B6CE-4629B35A7E69}", "{6157788F-DE83-4EDD-8A49-40DDE04DDB40}",
        "{71CAADC6-02FF-4AEA-830B-C527294E57B2}", "{D42A32EE-D758-4A14-8001-036E4AA37246}",
        "{FECB8535-CE31-47C2-A5F4-8B912FFF422A}", "{9E2F578F-CAD0-486B-A79B-3DAA6119DBB8}",
        "{65F91056-20DE-4777-A604-4A0F1803DAD5}", "{7B8BBEFE-A35A-44D1-A4A9-4E65BBE6E9B1}",
        "{C6C3ECE3-2869-47D4-A28B-F0F6335001CE}", "{BB3B2A36-63F9-4059-9102-D1B92D37E596}",
        "{2DF640CA-42E1-47AB-8E28-7B2B1B865701}", "{15F78336-E38C-4450-98E8-5BCB0299777B}",
        "{B7B353F1-FE2E-44E4-80ED-4104F72C7FCF}", "{061CC315-8A1F-4C5B-8ABB-E3E2B1CB2483}",
        "{BF4D02D3-8D0D-491E-81EC-56611BCDE409}", "{DA73E0A7-7679-42B8-A1ED-561F2BAA3478}",
        "{F9A04C4F-C140-4338-AF20-71A7810F9C7B}", "{3DE6522E-D250-4A31-860B-2E75027AB361}",
        "{6728339A-4FAB-4B36-BF79-6480F14AAAB8}", "{24ECAE83-E1D0-48B1-A65B-2E6882FCBD4A}",
        "{703BAA18-B3B7-4C8E-9545-6A38FEFA8E0C}", "{A5AB3F2F-8169-47C8-8A33-767ACDEB1864}",
        "{7A80DF48-8CE3-471A-9F76-899774442B68}", "{8620D5D3-6C5F-4E73-892D-A879592DAF0B}",
        "{6223D000-ED53-464A-A0A2-90EC8E67D531}", "{B61A61DF-C254-4578-B57A-BE38BEDF3670}]
    }
  ]
},
{
   "@id":"{9240F851-0E2A-4016-BACF-02AFB3DDAB74}",
   "@type":"case-investigation:ProvenanceRecord",
   "uco-core:description":"Segment files (38) partitions with E01Capture",
   "uco-observable:createdTime":{
        "@type": "xsd:dateTime",
        "@value": "2018-10-26T13:12:48.00Z"}
   },  
   "case-investigation:exhibitNumber":"NOT PROVIDED BY XML REPORT", 
   "uco-core:object":["{76087322-932D-4A64-B5C7-9FD4F4835386}", "{9E6B8C9D-5686-4CA8-A00C-05CA4107170E}", 
        "{CC6A7682-B6F3-4F14-9C94-DB6104A5EF8A}", "{C3D99EAD-F4C2-4EA1-AA95-A4578786CB7C}",
        "{ECC522D5-F0CE-4BAE-B4D2-05D192F2104D}", "{2A60ACC3-1C37-4831-B0AA-784F27B2ACA7}",
        "{1CFB3C01-9EB9-4209-946D-A6A9D24302B1}", "{9203DB1A-FB25-4FDD-BD42-0EEC0BD4D218}",
        "{DAB4363B-14FF-4852-B8F6-A1729DB4EF8C}", "{E916BECF-474E-4ABE-92B8-21332E4E7524}", 
        "{F58917F7-9E14-43DF-86B6-3AE0501CF1F7}", "{242F4AD9-729F-4A7E-9672-1ED06EDF7BE0}",
        "{725F48DC-AD3F-4FF0-B6CE-4629B35A7E69}", "{6157788F-DE83-4EDD-8A49-40DDE04DDB40}",
        "{71CAADC6-02FF-4AEA-830B-C527294E57B2}", "{D42A32EE-D758-4A14-8001-036E4AA37246}",
        "{FECB8535-CE31-47C2-A5F4-8B912FFF422A}", "{9E2F578F-CAD0-486B-A79B-3DAA6119DBB8}",
        "{65F91056-20DE-4777-A604-4A0F1803DAD5}", "{7B8BBEFE-A35A-44D1-A4A9-4E65BBE6E9B1}",
        "{C6C3ECE3-2869-47D4-A28B-F0F6335001CE}", "{BB3B2A36-63F9-4059-9102-D1B92D37E596}",
        "{2DF640CA-42E1-47AB-8E28-7B2B1B865701}", "{15F78336-E38C-4450-98E8-5BCB0299777B}",
        "{B7B353F1-FE2E-44E4-80ED-4104F72C7FCF}", "{061CC315-8A1F-4C5B-8ABB-E3E2B1CB2483}",
        "{BF4D02D3-8D0D-491E-81EC-56611BCDE409}", "{DA73E0A7-7679-42B8-A1ED-561F2BAA3478}",
        "{F9A04C4F-C140-4338-AF20-71A7810F9C7B}", "{3DE6522E-D250-4A31-860B-2E75027AB361}",
        "{6728339A-4FAB-4B36-BF79-6480F14AAAB8}", "{24ECAE83-E1D0-48B1-A65B-2E6882FCBD4A}",
        "{703BAA18-B3B7-4C8E-9545-6A38FEFA8E0C}", "{A5AB3F2F-8169-47C8-8A33-767ACDEB1864}",
        "{7A80DF48-8CE3-471A-9F76-899774442B68}", "{8620D5D3-6C5F-4E73-892D-A879592DAF0B}",
        "{6223D000-ED53-464A-A0A2-90EC8E67D531}", "{B61A61DF-C254-4578-B57A-BE38BEDF3670}]]
},
{% endhighlight %}

NOTE: Destination drive properties where output was saved as Serial Number = "Z50503SC" and Destination UID="SAS_D1/5C1C79AB3F137696"

### FORENSIC ACQUISITION RESULTS
Representing file segments of acquired forensic acquisition.

{% highlight json %}
{
   "@id":"{76087322-932D-4A64-B5C7-9FD4F4835386}", 
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
         "hash":[
         {
            "@type":"Hash",
            "hashMethod":"SHA1",
            "hashValue":"3f9006a2d3130c4845678bdb6824dbac2b12c9c8"
         }
         ]
      }
   ]
},
{
   "@id":"{9E6B8C9D-5686-4CA8-A00C-05CA4107170E}", 
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
   "@id":"{CC6A7682-B6F3-4F14-9C94-DB6104A5EF8A}", 
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
   "@id":"{C3D99EAD-F4C2-4EA1-AA95-A4578786CB7C}", 
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
   "@id":"{ECC522D5-F0CE-4BAE-B4D2-05D192F2104D}", 
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
   "@id":"{2A60ACC3-1C37-4831-B0AA-784F27B2ACA7}", 
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
   "@id":"{1CFB3C01-9EB9-4209-946D-A6A9D24302B1}", 
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
   "@id":"{9203DB1A-FB25-4FDD-BD42-0EEC0BD4D218}", 
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
   "@id":"{DAB4363B-14FF-4852-B8F6-A1729DB4EF8C}", 
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
   "@id":"{E916BECF-474E-4ABE-92B8-21332E4E7524}", 
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
   "@id":"{F58917F7-9E14-43DF-86B6-3AE0501CF1F7}", 
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
   "@id":"{242F4AD9-729F-4A7E-9672-1ED06EDF7BE0}", 
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
   "@id":"{725F48DC-AD3F-4FF0-B6CE-4629B35A7E69}", 
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
   "@id":"{6157788F-DE83-4EDD-8A49-40DDE04DDB40}", 
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
   "@id":"{71CAADC6-02FF-4AEA-830B-C527294E57B2}", 
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
   "@id":"{D42A32EE-D758-4A14-8001-036E4AA37246}", 
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
   "@id":"{FECB8535-CE31-47C2-A5F4-8B912FFF422A}", 
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
   "@id":"{9E2F578F-CAD0-486B-A79B-3DAA6119DBB8}", 
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
   "@id":"{65F91056-20DE-4777-A604-4A0F1803DAD5}", 
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
   "@id":"{7B8BBEFE-A35A-44D1-A4A9-4E65BBE6E9B1}", 
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
   "@id":"{C6C3ECE3-2869-47D4-A28B-F0F6335001CE}", 
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
   "@id":"{BB3B2A36-63F9-4059-9102-D1B92D37E596}", 
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
   "@id":"{2DF640CA-42E1-47AB-8E28-7B2B1B865701}", 
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
   "@id":"{15F78336-E38C-4450-98E8-5BCB0299777B}", 
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
   "@id":"{B7B353F1-FE2E-44E4-80ED-4104F72C7FCF}", 
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
   "@id":"{061CC315-8A1F-4C5B-8ABB-E3E2B1CB2483}", 
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
   "@id":"{BF4D02D3-8D0D-491E-81EC-56611BCDE409}", 
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
   "@id":"{DA73E0A7-7679-42B8-A1ED-561F2BAA3478}", 
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
   "@id":"{F9A04C4F-C140-4338-AF20-71A7810F9C7B}", 
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
   "@id":"{3DE6522E-D250-4A31-860B-2E75027AB361}", 
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
   "@id":"{6728339A-4FAB-4B36-BF79-6480F14AAAB8}", 
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
   "@id":"{24ECAE83-E1D0-48B1-A65B-2E6882FCBD4A}", 
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
   "@id":"{703BAA18-B3B7-4C8E-9545-6A38FEFA8E0C}", 
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
   "@id":"{A5AB3F2F-8169-47C8-8A33-767ACDEB1864}", 
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
   "@id":"{7A80DF48-8CE3-471A-9F76-899774442B68}", 
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
   "@id":"{8620D5D3-6C5F-4E73-892D-A879592DAF0B}", 
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
   "@id":"{6223D000-ED53-464A-A0A2-90EC8E67D531}", 
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
   "@id":"{B61A61DF-C254-4578-B57A-BE38BEDF3670}", 
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
