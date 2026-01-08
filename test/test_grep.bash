#!/bin/bash
# SPDX-FileCopyrightText: 2025 Duong Huyen
# SPDX-License-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source install/setup.bash

ros2 run mypkg pattern_filter &
FILTER_PID=$!
sleep 1

echo "hello ros" | ros2 run mypkg stream_publisher &
PUB_PID=$!
sleep 1

RESULT=$(timeout 2 ros2 topic echo /filtered_text --once)

kill $FILTER_PID
kill $PUB_PID

if echo "$RESULT" | grep -q "hello ros"; then
    echo "Test Passed: Filtered text received on topic"
    exit 0
else
    echo "Test Failed: No output on topic /filtered_text"
    exit 1
fi
