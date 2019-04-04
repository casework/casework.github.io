---
title: Introduction
jumbo_desc: What is CASE and where is it used?
---

### Exchange cyber-investigation information in standardized form
CASE is designed to support the widest possible range of information useful for cyber-investigations, including traces extracted from digital sources, evidence handling details, and actions on or within the data. For large data files such as forensic duplicates of hard drives or collected network traffic, CASE references rather than stores the large file and describes how to extract specific information.

##### Implementation examples
The [EVIDENCE2eCODEX](https://evidence2e-codex.eu) effort is working on transferring information in CASE format between European countries over the secure eCODEX infrastructure. FireEye is implementing CASE/UCO as part of their internal cyber-investigation ecosystem. Government organizations are using CASE to represent and exchange cyber-investigation in joint operations.

### Interoperability between systems and tools
Developers of systems and tools used in cyber-investigations are working to export information in CASE format to allow automated normalization, combination, correlation, and validation of information, which means less time extracting and combining data, and more time analyzing information.

##### Implementation examples
Members of the community are implementing CASE within tools used in cyber-investigations, including open source (CASE Plaso implementation and Volatility) and [commercial tools](/community/members.html).

### Maintain provenance at all phases of cyber-investigation lifecycle
A key component of CASE is standard representation for chain of custody (who handled the data at what point in time and where), and chain of evidence (what processes and tools were used to treat the data). This provenance information provides a clear pathway from each trace to the originating data source.

##### Implementation examples
This core function of CASE is an inherent part of all implementations and can support the General Data Protection Regulation (GDPR) requirements to track the use of cyber-investigation information throughout its lifecycle.

### Enhance tool testing and validation of results
When testing the functionality of a tool used in cyber-investigations, it is common practice to use datasets containing known values, or to compare results between tools. CASE can be used to automated comparison of results from multiple tools or different versions of the same tool.

##### Implementation examples
Current tool testing efforts involving CASE are focusing on deleted file recovery in digital forensic tools.

### Control access to privileged, proprietary, and personal information
Data markings are an inherent part of CASE, providing a mechanism to prevent privacy violations and exposure of secrets.

##### Implementation examples
Data markings are used by government and industry for data protection. In addition, data markings can provide a path to restricting use of data covered under license agreements.

### Unsupported structures
In some cyber-investigations, an evidential device contains data structures that are not supported by existing tools. A prime example of this is unsupported file systems on computing devices. Forensic analysts can figure out the file system structures and represent the results in a standardized format using CASE. Tools can then import the information represented using CASE and overlay the structure of the unsupported file system metadata onto a forensic duplicate of the evidential device for further processing using the features within the tool.

##### Implementation examples
An initiative is underway to implement this functionality in commercial and open source tools.

### Provide structure to support intelligent analysis
CASE is designed to support linked data and provides an enriched latticework of cyber-investigation information, opening new opportunities for contextual analysis, pattern recognition, machine learning, and visualization.
