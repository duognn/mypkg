# Simple Grep (ROS 2 Package)

[![build_and_test](https://github.com/duognn/simple_grep/actions/workflows/test.yml/badge.svg)](https://github.com/duognn/simple_grep/actions/workflows/test.yml)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

**simple_grep** is a ROS 2 package that implements a distributed text filtering system. It demonstrates the fundamental communication patterns in ROS 2, including Publishers, Subscribers, Parameters, and Launch files.

## Package Information
* **Maintainer**: duong (bangtuthao@gmail.com)
* **License**: BSD-3-Clause
* **Build Type**: ament_python

## 🛠 Dependencies
* **OS**: Ubuntu 22.04 (Jammy)
* **ROS 2 Distro**: Humble Hawksbill
* **Language**: Python 3.10+

##  Nodes Description

### 1. `stream_publisher`
Reads text input from `stdin` (Standard Input) and publishes it line-by-line to a ROS topic.

* **Publishes**:
    * Topic: `/text_stream`
    * Type: `std_msgs/msg/String`
    * Description: Raw text data input by the user.

### 2. `pattern_filter`
Subscribes to the text stream and prints only the lines containing a specific keyword (target word).

* **Subscribes**:
    * Topic: `/text_stream`
    * Type: `std_msgs/msg/String`
* **Parameters**:
    * `target_word` (string, default: "ros"): The keyword used to filter the incoming text stream.

##  Build Instructions

```bash
cd ~/ros2_ws
colcon build --packages-select simple_grep
source install/setup.bash

Usage
Using Launch File (Recommended)
The launch file starts the filter node with a configurable parameter.

Basic usage (Default filter: 'ros'):
ros2 launch simple_grep grep.launch.py

Custom filter (e.g., filter for 'error'):
ros2 launch simple_grep grep.launch.py target_word:=error
Manual Execution
Step 1: Start the Filter Node

Bash

ros2 run simple_grep pattern_filter --ros-args -p target_word:=hello
Step 2: Start the Publisher Node Open a new terminal and run:

Bash

ros2 run simple_grep stream_publisher
Note: Type text in the publisher terminal. Matching lines will appear in the filter terminal.

 Testing (CI/CD)
This package contains automated tests verified by GitHub Actions.

Run tests locally:

Bash

colcon test --packages-select simple_grep
colcon test-result --verbose
