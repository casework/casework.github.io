---
title: GitHub Policies
jumbo_desc:
---

This page describes policies to make stable addresses for software repositories on [https://github.com/casework/](https://github.com/casework/).

Types of repositories on GitHub/casework
----------------------------------------

### Implementation

An Implementation converts tool output to CASE. There is an inherent tie of a CASE Implementation to a specific tool or data format.

Originally, CASE had considered using "Proof of Concept," or "Implementation," for these repositories. On considering a "Development status" annotation for each repository, "Proof of Concept" no longer seemed worthwhile, as it could cause a repository rename if a proof of concept would gain sufficient interest.

### Utility

An intermediary tool not necessarily meant for end users, instead meant for adopting developers or intermediate workflow steps. A Utility is not tied to any particular tool, as that would be an Implementation. Framework tools would typically be Utilities.

### Bindings

Bindings provide support for generating CASE data for a programming language, not necessarily tied to any particular consumer tool.

NOTE - CASE does not use the term "API" here on account of "API" being overloaded, appearing in several usage situations for CASE. For instance, ontologies have an API, over REST. Some parties also consider providing a REST endpoint to be providing an API. "Bindings" is generally understood to be more scoped to just programming languages.

When does a repository go under github/casework?
------------------------------------------------

Either a code repository is hosted under casework, or would be hosted by a community member.

Hosting under casework:

-   There is an expectation that community members may participate in evolving the code.

-   To ease community-based maintenance and reduce decision points, the "Support requirements" section will be followed.

Hosting under the community member:

-   The organization expects to maintain the code themselves.

Support requirements of code repositories on github/casework
------------------------------------------------------------

These are graded support requirements, aligning with the repository's Development Status.

### Development Statuses

We have observed a software packaging ecosystem, Pypi, designate the Development Status of a project with these levels:

1 - Planning\
2 - Pre-Alpha\
3 - Alpha\
4 - Beta\
5 - Production/Stable\
6 - Mature\
7 - Inactive

CASE recommends adoption of these statuses for any repository hosted on github/casework, by specifying requirements to consider a repository having met a support level.

### Support requirements once a project reaches a development status

#### 3 - Alpha

-   Designation of versions of CASE and UCO the project supports.

-   Follow Semantic Versioning ([SEMVER](https://semver.org/spec/v2.0.0.html)).

#### 4 - Beta

-   Tests are implemented to confirm conformance with the specified versions of CASE and UCO.

-   Continuous Integration testing is implemented and reported for the main branch in the repository's README.

#### 5 - Production/Stable

-   Branches are managed with the [Gitflow branching policy](https://cyberdomainontology.org/ontology/development/#branching-cdo-git-flow).
