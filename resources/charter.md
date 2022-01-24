---
title: Technical Charter ("The Charter")
jumbo_desc: Cyber Domain Ontology Project a Series of LF Projects, LLC
---

*Adopted December 7, 2021*

This Charter sets forth the responsibilities and procedures for technical contribution to, and oversight of, the Cyber Domain Ontology open source project, which has been established as Cyber Domain Ontology Project a Series of LF Projects, LLC (the “Project”). LF Projects, LLC (“LF Projects”) is a Delaware series limited liability company. All contributors (including committers, maintainers, and other technical positions) and other participants in the Project (collectively, “Collaborators”) must comply with the terms of this Charter. 

1. **Mission and Scope of the Project**

   a) The mission of the Project is to develop, and promote the adoption of a community developed ecosystem for standardized information representation across the cyber domain, based on the Unified Cyber Ontology (UCO), including application domain ontologies such as the Cyber-investigation Analysis Standard Expression (CASE). The Cyber Domain Ontology (CDO) is intended to serve the needs of a broad range of domains, including cyber-investigation, digital forensics, incident response, cyber risk management, supply chain security, threat intelligence, and computer/network protection. UCO serves as a foundation for modeling cyber domain concepts and elements using a standardized representation that is both human-understandable and machine-interpretable. The primary motivation for UCO is to establish a middle domain ontology that supports information representations for related application domain ontology communities, defined as context-specific extensions within the consistent overall Cyber Domain Ontology ecosystem. Through this approach not only are domain-focused representations defined consistently but they also can take advantage of shared APIs/tooling and information flow in an automated fashion across application domain boundaries. CASE, which aligns with and extends UCO, is an evolving standard for representing information commonly analyzed and exchanged during investigations involving digital evidence. The primary motivation for CASE is to lessen the analytic burden of cyber investigators by providing a common language to support automated interoperability, normalization, combination and validation of varied information sources to facilitate analysis and exploration of investigative questions. In addition to advancing the efficient and accurate exchange of cyber-investigation information between tools and organizations, CASE ensures that analysis results can be traced back to their source(s), keeping track of when, where and who used which tools to perform investigative actions on data sources. 

   b) The following foundational principles outline the fundamental ethos of the Cyber Domain Ontology ecosystem. These principles are immutable and lay the foundation for the activities of the Technical Steering Committee (TSC) and relevant initiatives within the Cyber Domain Ontology project:

   - Concepts and capabilities that are relevant to more than one application domain should be placed into UCO. Concepts and capabilities that are relevant to a single application domain should be placed in the relevant application domain ontology.
   - UCO concept semantics, structure and constraints at both a design and implementation level must always support broad applicability across the cyber domain and not be biased to any particular one or more application domains. Maintaining broad applicability may involve compromises from optimal solutions for any single application domain in order to support the strategic objective for the overall ecosystem initiative.
   - Due to the inherency of incomplete understanding and conceptual coverage at any point in time, the inexorable evolution of domain needs over time, and the uniquely specialized needs of adopters, UCO must support practical extensibility at both an explicit design level and an implicit user level. 
     - At an explicit design-level, this would include the potential for adopters to define relevant class, property, datatype or vocabulary extensions to UCO to support their needs as long as they are not in conflict with existing UCO definitions and structures. If relevant to other adopters and multiple application domains these extensions may be considered for future inclusion in UCO. 
     - At an implicit user-level, this would include classes asserting open shapes (to allow custom properties to be added at time of use) and defined vocabularies to be open to provide suggested values for consistent normalization but also allow values outside the predefined set. Validation should flag such customizations as warnings but not as errors.
   - UCO must seek a balance between top-down and bottom-up ontological rigor with a clear decisive bias toward practicality and flexibility.
   - UCO should bias toward inclusion rather than exclusion of conceptual coverage. Concepts and structure should be included in UCO if they are relevant to more than one application domain even if they are not relevant to all application domains.

   c) The scope of the Project includes collaborative development under the Project License (as defined herein) supporting the mission, including documentation, testing, integration and the creation of other artifacts that aid the development, deployment, operation or adoption of the open source Project.

2. **Technical Steering Committee**

   a) The Technical Steering Committee (the “TSC”) will be responsible for all technical oversight of the open source Project in accordance with project policy and foundational principles. 

   b) The TSC is composed of individuals who are voting members, all from different employers, with up to two representatives for each of the following categories of participants (“Participant Categories”): 

   - each ontology community;
   - for-profit entities;
   - academic institutions;
   - any local, regional or national government or agency thereof; and
   - non-profit entities. 

   c) The TSC will appoint an Ombudsperson, from a different employer than members of the TSC, to provide independent and impartial oversight, to resolve conflicts, and to maintain conformance with project policies and foundational principles.

   d) At the inception of the Project, the TSC members will be as set forth within the “AUTHORS” file within the Project’s code repository. Following inception of the Project, every 12-months or as otherwise decided by the TSC, the TSC will call for elections for each of the “Participant Categories.” Election procedures will be decided upon by the TSC. The TSC will take nominations from and hold elections by the Active Contributors.

   “Active Contributors” mean those contributors and participants who, within the prior 12 months, have participated in at least either (a) two in person, telephone or online meetings of the Project, or (b) made contributions of technical artifacts (whether code, data, documentation, specifications or similar) to the Project.

   e) Any meetings of the Technical Steering Committee are intended to be open to the public, and can be conducted electronically, via teleconference, or in person. 

   f) TSC initiatives generally will involve Contributors and Committers. The TSC may adopt or modify roles so long as the roles are documented in the AUTHORS file, and instructions for contributing as documented in the CONTRIBUTING file. Unless otherwise documented: 

   - Contributors include anyone in the technical community that contributes code, documentation, or other technical artifacts to the Project; 
   - Committers are Contributors who have earned the ability to modify (“commit”) source code, documentation or other technical artifacts in a Project’s repository; and
   - A Contributor may become a Committer by a majority approval of the TSC. A Committer may be removed by a majority approval of the TSC.

   g) Participation in the Project through becoming a Contributor and Committer is open to anyone so long as they abide by the terms of this Charter. 

   h) The TSC may (1) establish work flow procedures for the submission, approval, and closure/archiving of initiatives, (2) set requirements for the promotion of Contributors to Committer status, as applicable, and (3) amend, adjust, refine and/or eliminate the roles of Contributors, and Committers, and create new roles, and publicly document any TSC roles, as it sees fit.

   i) The TSC may elect a TSC Chair, who will preside over meetings of the TSC and will serve until their resignation or replacement by the TSC. The TSC Chair can appoint a Vice-Chair to preside over TSC meetings and fulfill TSC Chair responsibilities when the TSC Chair is not available. The TSC Chair can appoint chairs and assistant chairs of committees, including an Ontology Committee (OC) and Adoption Committee (AC). The TSC Chair, or any other TSC member so designated by the TSC, will serve as the primary communication contact between the Project and the Cyber Domain Ontology Fund of The Linux Foundation.

   j) Responsibilities: The TSC will be responsible for all aspects of oversight relating to the Project, which may include:

   - coordinating the technical direction of the Project in accordance with project policy;
   - approving initiative or system proposals (including, but not limited to, incubation, deprecation, and changes to a sub-project’s scope);
   - organizing sub-projects and removing sub-projects;
   - creating sub-committees or working groups to focus on cross-project technical issues and requirements;
   - appointing representatives to work with other open source or open standards communities;
   - establishing community norms, workflows, issuing releases, and security issue reporting policies;
   - approving and implementing policies and processes for contributing (to be published in the CONTRIBUTING file) and coordinating with the series manager of the Project (as provided for in the Series Agreement, the “Series Manager”) to resolve matters or concerns that may arise as set forth in Section 7 of this Charter;
   - discussions, seeking consensus, and where necessary, voting on technical matters relating to the code base that affect multiple initiatives; and
   - coordinating any marketing, events, or communications regarding the Project.

3. **TSC Voting**

   a) While the Project aims to operate as a consensus-based community, if any TSC decision requires a vote to move the Project forward, the voting members of the TSC will vote on a one vote per voting member basis. 

   b) Quorum for TSC meetings requires at least fifty percent of all members of the TSC to be present, with representatives from at least three of the four classes (For-profit, Academia, Government, and Non-Profit). The TSC may continue to meet if quorum is not met but will be prevented from making any decisions at the meeting.

   c) Except as provided in Section 8.c. and 9.a, decisions by vote at a meeting require a majority vote of those in attendance, provided quorum is met. The majority vote must include at least three of the four classes (For-profit, Academia, Government, and Non-Profit). Decisions made by electronic vote without a meeting require a majority vote of all voting members of the TSC.

   d) In the event a vote cannot be resolved by the TSC, any member of the TSC may first raise the matter to the Ombudsperson for assistance in reaching a resolution. and, if the vote still cannot be resolved, may then refer the matter to the Series Manager for assistance in reaching a resolution.

4. **Committees**

   a) Ontology Committees

   - The purpose of the Ontology Committees is to facilitate the development and publishing of a Cyber Domain Ontology ecosystem. Each Ontology Committee is responsible for addressing all aspects of development, standardization, and documentation of their application domain ontology, or in the case of UCO the foundation ontology itself, within the Cyber Domain Ontology ecosystem. This includes the Ontology design, specific content of the ontology (e.g., classes, properties, and value types), selection of representation language(s), approval of all change requests, review of mappings, and determination of requirements for ontology metadata and documentation.
   - Members of each Ontology Committee are appointed by the TSC annually to one-year terms, or as otherwise determined by the TSC. The size of each Ontology Committee will be as decided by the TSC.

   b) Adoption Committee

   - The purpose of the Adoption Committee is to serve as a community-based forum to support Cyber Domain Ontology adoption as a technical standard for groups of people, systems, and software tools to automatically normalize, exchange, combine, correlate, validate and analyze cyber domain information. In order to do this, the Adoption Committee shall function as:
     - the working group for providing conditions and guidance for Cyber Domain Ontology compliance,
     - the coordinating body for the Cyber Domain Ontology Community to address all aspects of Cyber Domain Ontology adoption (e.g., mapping, importing, exporting, training aids and workshops, supporting framework tools and software integration), and
     - a technical advisory group for Cyber Domain Ontology adoption matters, including the oversight of the creation of software and documentation with respect to use of the Cyber Domain Ontology. Members of the Adoption Committee are appointed by the TSC annually to one-year terms, or as otherwise determined by the TSC. The size of the Adoption Committee will be as decided by the TSC. 

5. **Compliance with Policies**

   a) This Charter is subject to the Series Agreement for the Project and the Operating Agreement of LF Projects. Contributors will comply with the policies of LF Projects as may be adopted and amended by LF Projects, including, without limitation the policies listed at [https://lfprojects.org/policies/](https://lfprojects.org/policies/).

   b) The TSC shall adopt and maintain the code of conduct (“CoC”) for the Project ([https://caseontology.org/resources/coc.html](https://caseontology.org/resources/coc.html)), which is subject to approval by the Series Manager. In the event that a Project-specific CoC has not been approved, the LF Projects Code of Conduct listed at [https://lfprojects.org/policies](https://lfprojects.org/policies) will apply for all Collaborators in the Project.

   c) When amending or adopting any policy applicable to the Project, LF Projects will publish such policy, as to be amended or adopted, on its web site at least 30 days prior to such policy taking effect; provided, however, that in the case of any amendment of the Trademark Policy or Terms of Use of LF Projects, any such amendment is effective upon publication on LF Project’s web site.

   d) All Collaborators must allow open participation from any individual or organization meeting the requirements for contributing under this Charter and any policies adopted for all Collaborators by the TSC, regardless of competitive interests. Put another way, the Project community must not seek to exclude any participant based on any criteria, requirement, or reason other than those that are reasonable and applied on a non-discriminatory basis to all Collaborators in the Project community.

   e) The Project will operate in a transparent, open, collaborative, and ethical manner at all times. The output of all Project discussions, proposals, timelines, decisions, and status should be made open and easily visible to all. Any potential violations of this requirement should be reported immediately to the Series Manager.

6. **Community Assets**

   a) LF Projects will hold title to all trade or service marks used by the Project (“Project Trademarks”), whether based on common law or registered rights. Project Trademarks will be transferred and assigned to LF Projects to hold on behalf of the Project. Any use of any Project Trademarks by Collaborators in the Project will be in accordance with the license from LF Projects and inure to the benefit of LF Projects.

   b) The Project will, as permitted and in accordance with such license from LF Projects, develop and own all Project GitHub and social media accounts, and domain name registrations created by the Project community.

   c) Under no circumstances will LF Projects be expected or required to undertake any action on behalf of the Project that is inconsistent with the tax-exempt status or purpose, as applicable, of the Joint Development Foundation or LF Projects, LLC.

7. **General Rules and Operations**

   a) The Project will:

   - engage in the work of the Project in a professional manner consistent with maintaining a cohesive community, while also maintaining the goodwill and esteem of LF Projects, Joint Development Foundation and other partner organizations in the open source community; and
   - respect the rights of all trademark owners, including any branding and trademark usage guidelines.


8. **Intellectual Property Policy**

   a) Collaborators acknowledge that the copyright in all new contributions will be retained by the copyright holder as independent works of authorship and that no contributor or copyright holder will be required to assign copyrights to the Project. 

   b) Except as described in Section 7.c., all contributions to the Project are subject to the following: 

   - All new inbound code contributions to the Project must be made using the Apache License, Version 2.0, available at [https://www.apache.org/licenses/LICENSE-2.0](https://www.apache.org/licenses/LICENSE-2.0) (the “Project License”). 
   - All new inbound code contributions must also be accompanied by a Developer Certificate of Origin ([http://developercertificate.org](http://developercertificate.org/)) sign-off in the source code system that is submitted through a TSC-approved contribution process which will bind the authorized contributor and, if not self-employed, their employer to the applicable license;
   - All outbound code will be made available under the Project License.
   - Documentation other than specifications will be received and made available by the Project under the Creative Commons Attribution 4.0 International License (available at [http://creativecommons.org/licenses/by/4.0/](http://creativecommons.org/licenses/by/4.0/)). Specifications, including contributions to the CASE Ontology, will be received and made using the Project License.
   - To the extent a contribution includes or consists of data, any rights in such data shall be made available under the CDLA-Permissive 2.0 License.
   - The Project may seek to integrate and contribute back to other open source projects (“Upstream Projects”). In such cases, the Project will conform to all license requirements of the Upstream Projects, including dependencies, leveraged by the Project. Upstream Project code contributions not stored within the Project’s main code repository will comply with the contribution process and license terms for the applicable Upstream Project.


   c) The TSC may approve the use of an alternative license or licenses for inbound or outbound contributions on an exception basis. To request an exception, please describe the contribution, the alternative open source license(s), and the justification for using an alternative open source license for the Project. License exceptions must be approved by a two-thirds vote of the entire TSC. 

   d) Contributed files should contain license information, such as SPDX short form identifiers, indicating the open source license or licenses pertaining to the file.

9. **Amendments**

   a) This charter may be amended by a two-thirds vote of the entire TSC and is subject to approval by LF Projects.




##### Change Register:

{: .table .table-bordered}
|--- |--- |
|Change|Ratification Date|
| | |