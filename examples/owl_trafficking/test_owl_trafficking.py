#!/usr/bin/make -f

# This software was developed at the National Institute of Standards
# and Technology by employees of the Federal Government in the course
# of their official duties. Pursuant to title 17 Section 105 of the
# United States Code this software is not subject to copyright
# protection and is in the public domain. NIST assumes no
# responsibility whatsoever for its use by other parties, and makes
# no guarantees, expressed or implied, about its quality,
# reliability, or any other characteristic.
#
# We would appreciate acknowledgement if the software is used.

import os

import pytest
import rdflib.plugins.sparql

NS_SH = rdflib.SH

NSDICT = {"sh": NS_SH}


def load_validation_graph(filename: str, expected_conformance: bool) -> rdflib.Graph:
    g = rdflib.Graph()
    g.parse(filename, format="turtle")
    g.namespace_manager.bind("sh", NS_SH)

    query = rdflib.plugins.sparql.processor.prepareQuery(
        """\
SELECT ?lConforms
WHERE {
  ?nReport
    a sh:ValidationReport ;
    sh:conforms ?lConforms ;
    .
}
""",
        initNs=NSDICT,
    )

    computed_conformance = None
    for result in g.query(query):
        (l_conforms,) = result
        computed_conformance = bool(l_conforms)
    assert expected_conformance == computed_conformance
    return g


# TODO
@pytest.mark.xfail(
    reason="At least one issue known present with vocabulary items.  Once UCO ticket OC-12 is resolved, this xfail annotation should be removed.",
    strict=True,
)
def test_owl_trafficking_validation() -> None:
    """
    Confirm the instance data passes validation.
    """
    g = load_validation_graph(
        os.path.join(os.path.dirname(__file__), "owl_trafficking_validation.ttl"), True
    )
    assert isinstance(g, rdflib.Graph)
