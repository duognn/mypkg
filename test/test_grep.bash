#!/bin/bash
# SPDX-FileCopyrightText: 2025 Duong Huyen
# SPDX-License-Identifier: BSD-3-Clause

source /opt/ros/humble/setup.bash
source ../../install/setup.bash

# Define output file
OUTPUT_FILE="/tmp/grep_test_output.txt"
rm -f $OUTPUT_FILE

echo "Test 1: Starting pattern_filter (target='hello')..."

ros2 run mypkg pattern_filter --ros-args -p target_word:=hello > $OUTPUT_FILE &
FILTER_PID=$!

sleep 2

echo "Test 2: Publishing data..."
# Case A: Should be detected
echo "hello world" | ros2 run mypkg stream_publisher
sleep 1
# Case B: Should be ignored
echo "goodbye world" | ros2 run mypkg stream_publisher
sleep 1

kill $FILTER_PID

# Check the result
echo "Checking results..."
if grep -q "hello world" $OUTPUT_FILE; then
    echo "SUCCESS: Found 'hello world'"
else
    echo "FAILURE: 'hello world' not found"
    exit 1
fi

if grep -q "goodbye world" $OUTPUT_FILE; then
    echo "FAILURE: Found 'goodbye world' (Should be filtered out)"
    exit 1
else
    echo "SUCCESS: 'goodbye world' correctly filtered out"
fi

echo "All tests passed!"
exit 0
