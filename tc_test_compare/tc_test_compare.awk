#!/usr/bin/awk

# For use by tc_test_compare.sh

BEGIN {
    FS=",";
    OFS=":";
    totalDelta=0
}

{
    print $1, " " ($3 - $2)/1000.0 " seconds";
    totalDelta += ($3 - $2)/1000.0;
}

END {
    print "TOTAL DELTA", " " totalDelta " seconds (" (totalDelta/60) " minutes)"
}
