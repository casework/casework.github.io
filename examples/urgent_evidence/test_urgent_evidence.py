#!/usr/bin/env python3

import logging
import os

import rdflib.plugins.sparql

_logger = logging.getLogger(os.path.basename(__file__))

graph = rdflib.Graph()
graph.parse("urgent_evidence.json", format="json-ld")

# Inherit prefixes defined in input context dictionary.
nsdict = {k:v for (k,v) in graph.namespace_manager.namespaces()}

def test_exhibit_photos():
    file_names_computed = set()
    file_names_ground_truth_positive = {
      "IMG_4829.jpg",
      "IMG_4830.jpg",
      "IMG_4831.jpg",
      "IMG_4832.jpg",
      "IMG_4833.jpg",
      "IMG_4834.jpg"
    }
    file_names_ground_truth_negative = {
      "IMG_1863.jpg"
    }

    select_query_text = None
    with open("urgent_evidence-query-exhibit_photos.sparql", "r") as in_fh:
        select_query_text = in_fh.read().strip()
    _logger.debug("select_query_text = %r." % select_query_text)
    select_query_object = rdflib.plugins.sparql.prepareQuery(select_query_text, initNs=nsdict)
    for record in graph.query(select_query_object):
        (
          l_exhibit_number,
          l_file_name,
          l_modified_time,
          l_hash_value,
        ) = record
        file_names_computed.add(l_file_name.toPython())

    file_names_true_positive = file_names_computed & file_names_ground_truth_positive
    assert file_names_ground_truth_positive == file_names_true_positive

    file_names_false_positive = file_names_computed & file_names_ground_truth_negative
    assert set() == file_names_false_positive
