#!/usr/bin/env python3

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

import logging
import os
import pathlib

import pytest
import rdflib.plugins.sparql

import case_utils.ontology

_logger = logging.getLogger(os.path.basename(__file__))

NS_SH = rdflib.SH

graph = rdflib.Graph()
graph.parse("generated-urgent_evidence.ttl", format="turtle")
graph.parse("generated-urgent_evidence-wasInformedBy.json", format="json-ld")
# TODO - Remove CASE-unstable.ttl reference on release of CASE 0.6.0.
top_srcdir = pathlib.Path(os.path.dirname(__file__)).parent.parent.parent
graph.parse(str(top_srcdir / "dependencies" / "CASE-unstable.ttl"))

# Inherit prefixes defined in input context dictionary.
nsdict = {k: v for (k, v) in graph.namespace_manager.namespaces()}
nsdict["sh"] = NS_SH


def load_validation_graph(filename: str, expected_conformance: bool) -> rdflib.Graph:
    g = rdflib.Graph()
    g.parse(filename, format="turtle")
    g.namespace_manager.bind("sh", NS_SH)

    query = rdflib.plugins.sparql.prepareQuery(
        """\
SELECT ?lConforms
WHERE {
  ?nReport
    a sh:ValidationReport ;
    sh:conforms ?lConforms ;
    .
}
""",
        initNs=nsdict,
    )

    computed_conformance = None
    for result in g.query(query):
        (l_conforms,) = result
        computed_conformance = bool(l_conforms)
    assert expected_conformance == computed_conformance
    return g


@pytest.fixture
def action_iris_all():
    retval = set()
    select_query_object = rdflib.plugins.sparql.prepareQuery(
        """\
SELECT ?nAction
WHERE {
  ?nAction a case-investigation:InvestigativeAction .
}
""",
        initNs=nsdict,
    )
    for record in graph.query(select_query_object):
        retval.add(record[0].toPython())
    assert len(retval) > 0, "Failed to retrieve investigative actions."
    return retval


def test_actions_to_photo(action_iris_all):
    action_iris_computed = set()
    action_iris_ground_truth_positive = {
        "http://example.org/kb/action-uuid-1",
        "http://example.org/kb/action-uuid-3",
        "http://example.org/kb/action-uuid-7",
    }
    action_iris_ground_truth_negative = (
        action_iris_all - action_iris_ground_truth_positive
    )

    _logger.debug("len(action_iris_all) = %d.", len(action_iris_all))
    _logger.debug(
        "len(action_iris_ground_truth_positive) = %d.",
        len(action_iris_ground_truth_positive),
    )
    _logger.debug(
        "len(action_iris_ground_truth_negative) = %d.",
        len(action_iris_ground_truth_negative),
    )

    select_query_text = None
    with open("query-actions_to_artifact.sparql", "r") as in_fh:
        select_query_text = in_fh.read().strip()
    _logger.debug("select_query_text = %r." % select_query_text)
    select_query_object = rdflib.plugins.sparql.prepareQuery(
        select_query_text, initNs=nsdict
    )
    for record in graph.query(select_query_object):
        (n_deriving_action, l_description) = record
        action_iris_computed.add(n_deriving_action.toPython())

    action_iris_true_positive = action_iris_computed & action_iris_ground_truth_positive
    assert action_iris_ground_truth_positive == action_iris_true_positive

    action_iris_false_positive = (
        action_iris_computed & action_iris_ground_truth_negative
    )
    assert set() == action_iris_false_positive


def test_exhibit_photos():
    file_names_computed = set()
    file_names_ground_truth_positive = {
        "IMG_4829.jpg",
        "IMG_4830.jpg",
        "IMG_4831.jpg",
        "IMG_4832.jpg",
        "IMG_4833.jpg",
        "IMG_4834.jpg",
    }
    file_names_ground_truth_negative = {"IMG_1863.jpg"}

    select_query_text = None
    with open("query-exhibit_photos.sparql", "r") as in_fh:
        select_query_text = in_fh.read().strip()
    _logger.debug("select_query_text = %r." % select_query_text)
    select_query_object = rdflib.plugins.sparql.prepareQuery(
        select_query_text, initNs=nsdict
    )
    for record in graph.query(select_query_object):
        (
            l_exhibit_number,
            l_file_name,
            l_modified_time,
            l_hash_value,
        ) = record
        file_names_computed.add(l_file_name.toPython())
    _logger.debug("file_names_computed = %r.", file_names_computed)

    file_names_true_positive = file_names_computed & file_names_ground_truth_positive
    assert file_names_ground_truth_positive == file_names_true_positive

    file_names_false_positive = file_names_computed & file_names_ground_truth_negative
    assert set() == file_names_false_positive


def test_photo_selection():
    file_name_status_computed = set()
    file_name_status_expected = {
        ("IMG_1863.jpg", "Selected"),
        ("IMG_1864.jpg", "Displayed"),
        ("IMG_1865.jpg", "Not displayed"),
    }

    select_query_text = None
    with open("query-selection_from_automated_exhibit_extraction.sparql", "r") as in_fh:
        select_query_text = in_fh.read().strip()
    _logger.debug("select_query_text = %r." % select_query_text)
    select_query_object = rdflib.plugins.sparql.prepareQuery(
        select_query_text, initNs=nsdict
    )
    for record in graph.query(select_query_object):
        (l_file_name, l_review_status) = record
        file_name_status_computed.add(
            (l_file_name.toPython(), l_review_status.toPython())
        )

    assert file_name_status_expected == file_name_status_computed


# TODO
@pytest.mark.xfail(
    reason="At least one issue known present with vocabulary items.  Once UCO ticket OC-12 is resolved, this xfail annotation should be removed.",
    strict=True,
)
def test_urgent_evidence_validation():
    """
    Confirm the instance data passes validation.
    """
    g = load_validation_graph(
        os.path.join(os.path.dirname(__file__), "urgent_evidence_validation.ttl"), True
    )
    assert isinstance(g, rdflib.Graph)
