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
This no-op script's purpose is to fulfill a role requested by the
generic example processing framework.  Other examples combine snippets
into single file.  The Urgent Evidence narrative, to date, only has one
file, so requires no further work to construct.
"""

__version__ = "0.1.0"

import argparse
import sys


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("in_json")
    args = parser.parse_args()

    with open(args.in_json, "r") as in_fh:
        sys.stdout.write(in_fh.read())


if __name__ == "__main__":
    main()
