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

"""
This script executs a query, returning an unadorned HTML table representation.  The design of the workflow is based on this example built on SPARQLWrapper:
https://lawlesst.github.io/notebook/sparql-dataframe.html

Note that this assumes a limited syntax style in the outer SELECT clause of the query - only named variables, no aggregations, and a single space character separating all variable names.  E.g.:

SELECT ?x ?y ?z
WHERE
{ ... }

The word "DISTINCT" will also be cut from the query, if present.

Should a more complex query be necessary, an outer, wrapping SELECT query would let this script continue to function.
"""

__version__ = "0.2.0"

import os
import logging

import pandas as pd
import rdflib.plugins.sparql

_logger = logging.getLogger(os.path.basename(__file__))

def main():
    query_text = None
    with open(args.in_sparql, "r") as in_fh:
        query_text = in_fh.read().strip()
    _logger.debug("query_text = %r." % query_text)

    # Build columns list from SELECT line.
    query_text_lines = query_text.split("\n")
    select_line = [line for line in query_text_lines if line.startswith("SELECT ")][0]
    variables = select_line.replace(" DISTINCT", "").replace("SELECT ", "").split(" ")

    graph = rdflib.Graph()
    graph.parse(args.in_graph, format="json-ld")

    # Inherit prefixes defined in input context dictionary.
    nsdict = {k:v for (k,v) in graph.namespace_manager.namespaces()}

    tally = 0
    records = []
    query_object = rdflib.plugins.sparql.prepareQuery(query_text, initNs=nsdict)
    for (row_no, row) in enumerate(graph.query(query_object)):
        tally = row_no + 1
        record = []
        for (column_no, column) in enumerate(row):
            column_value = "" if column is None else column.toPython()
            if row_no == 0:
                _logger.debug("row[0]column[%d] = %r." % (column_no, column_value))
            record.append(column_value)
        records.append(record)
    if tally == 0:
        if not args.allow_empty_results:
            raise ValueError("Failed to return any results.")

    # https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.to_html.html
    df = pd.DataFrame(records, columns=variables)
    html = df.to_html(classes=("table", "table-bordered", "table-condensed"))

    with open(args.out_html, "w") as out_fh:
        out_fh.write(html)

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("-d", "--debug", action="store_true")
    parser.add_argument("--allow-empty-results", action="store_true")
    parser.add_argument("in_graph")
    parser.add_argument("in_sparql")
    parser.add_argument("out_html")
    args = parser.parse_args()
    logging.basicConfig(level=logging.DEBUG if args.debug else logging.INFO)
    main()
