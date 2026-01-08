#!/bin/bash
# SPDX-FileCopyrightText: 2025 Duong Huyen
# SPDX-License-Identifier: BSD-3-Clause

source /opt/ros/humble/setup.bash

if [ -d "/root/ros2_ws" ]; then
    cd /root/ros2_ws
elif [ -d "$HOME/ros2_ws" ]; then
    cd $HOME/ros2_ws
else
    echo "Error: Could not find ros2_ws directory!"
    exit 1
fi

colcon build
source install/setup.bash

ros2 run mypkg pattern_filter &
FILTER_PID=$!
sleep 2  

echo "hello ros" | ros2 run mypkg stream_publisher &
PUB_PID=$!
sleep 2

RESULT=$(timeout 5 ros2 topic echo /filtered_text --once)

kill $FILTER_PID
kill $PUB_PID

if echo "$RESULT" | grep -q "hello ros"; then
    echo "Test Passed: Correct output received"
    exit 0
else
    echo "Test Failed: Expected 'hello ros', but got nothing or wrong data"
    echo "Debug info: Result was: $RESULT"
    exit 1
fi
