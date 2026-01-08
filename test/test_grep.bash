#!/bin/bash
# SPDX-FileCopyrightText: 2025 Duong Huyen
# SPDX-License-Identifier: BSD-3-Clause

source /opt/ros/humble/setup.bash

if [ -d "/root/ros2_ws" ]; then
    cd /root/ros2_ws
elif [ -d "$HOME/ros2_ws" ]; then
    cd $HOME/ros2_ws
else
    echo "Error: Workspace not found"
    exit 1
fi

colcon build
source install/setup.bash

ros2 run mypkg pattern_filter &
NODE_PID=$!
sleep 1

timeout 10 ros2 topic echo /filtered_text > /tmp/mypkg_test.log &
sleep 2 
echo "hello ros" | ros2 run mypkg stream_publisher
sleep 2

kill $NODE_PID

if grep -q "hello ros" /tmp/mypkg_test.log; then
    echo "Test Passed: Found 'hello ros' in topic output"
    exit 0
else
    echo "Test Failed: 'hello ros' not found in topic output"
    echo "--- Debug: Content of /tmp/mypkg_test.log ---"
    cat /tmp/mypkg_test.log
    exit 1
fi
