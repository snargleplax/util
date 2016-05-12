#!/bin/bash

# Compare two test result CSV files from TeamCity to show deltas in test timing.
# Files MUST be converted from DOS line endings first (use dos2unix).

PRE_SORT="sort -k2 -t,"
POST_SORT="sort -n -r -k2 -t:"
JOIN_CMD="join -t, -o 0,1.4,2.4 -1 2 -2 2"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
AWK_CMD="awk -f $SCRIPT_DIR/tc_test_compare.awk"

echo "Test duration delta between $1 and $2 (positive means second file had the slower run):"

$JOIN_CMD <(tail -n+2 $1 |$PRE_SORT) <(tail -n+2 $2 | $PRE_SORT) | sed -e 's/TestSuite: //' | $AWK_CMD | $POST_SORT
