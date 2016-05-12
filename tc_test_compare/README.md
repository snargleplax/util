# TeamCity test run comparison

TeamCity provides CSV files that can be downloaded showing the test results from any build. This script compares two
such files and computes the test-by-test differences in timing.  This makes it easier to find tests with significantly
different runtime between the two builds.

## Usage

1. Download the CSV files you want from TeamCity.
2. Run `dos2unix` or a similar program on each of them, to fix up the line endings (otherwise the script won't work).
3. Invoke like:
```
tc_test_compare.sh file1.csv file2.csv
```
