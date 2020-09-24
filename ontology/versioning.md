---
title: CASE Ontology Versioning
jumbo_desc: How CASE ontology versioning works
---

The syntax for versioning will follow a <***major***>.<***minor***>.<***hotfix***> numeric pattern, e.g., version **1.2.4**.

Major
: Introduces new features or changes that break backwards compatibility

Format: Increments <*major*> version number and zeroes out <*minor*> and <*hotfix*> numbers, e.g., **1.2.4 <i class="fas fa-arrow-right"></i> 2.0.0**

Minor
: Introduces new features or changes, but does **not** break backwards compatibility

Format: Increments <*minor*> version number and zeroes out <*hotfix*> number, e.g., **1.2.4 <i class="fas fa-arrow-right"></i> 1.3.0**

Hotfix
: Addresses a critical error and can break backwards compatibility where it is necessary to apply a fix

Format: Increments <*hotfix*> version number, e.g., **1.2.4 <i class="fas fa-arrow-right"></i> 1.2.5**
