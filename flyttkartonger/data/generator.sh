#!/usr/bin/env bash

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution js.cpp

samplegroup
sample 1
sample 2
sample 3

group group1 20
tc_manual ../manual_tc/g1.in

group group2 20
include_group group1
tc_manual ../manual_tc/g2.in


group group3 20
include_group sample
include_group group2
tc_manual ../manual_tc/g3.in

group group4 40
include_group group3
tc_manual ../manual_tc/g4.in
tc_manual ../manual_tc/g5.in
