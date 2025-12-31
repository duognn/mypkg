# mypkg
[![Build Status](https://github.com/duognn/simple_grep/actions/workflows/test.yml/badge.svg)](https://github.com/duognn/simple_grep/actions/workflows/test.yml)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

A text filtering package for ROS 2.
---
## Description
This package demonstrates a simple implementation of the "grep" command using ROS 2 nodes (Publisher/Subscriber pattern).
- **stream_publisher**: Reads text from standard input and publishes it.
- **pattern_filter**: Subscribes to the stream and filters lines containing a keyword.
---
## Requirement
* ROS 2 Humble
* Python 3.10
---
## Installation
```bash
 cd ~/ros2_ws/src
 git clone https://github.com/duognn/mypkg.git
 cd ~/ros2_ws
 colcon build --packages-select mypkg
 source install/setup.bash
```
---
## Usage
You need two terminals to run this system.

*Terminal 1: Filter

Start the filter node. It waits for incoming text.
```bash
 ros2 run mypkg pattern_filter
```
Note: After running this command, nothing will happen on the screen. The node is waiting for incoming data. Keep this terminal open and visible.

*Terminal 2: Publisher

Run the publisher:
```bash
 ros2 run mypkg stream_publisher
```
Type words and press Enter:
```bash
this is a test     # No output in Terminal 1
i love ros         # Output appears in Terminal 1!
ros 2 is cool      # Output appears in Terminal 1!
```
Check Result: Look back at Terminal 1. You should see the filtered lines:
```bash 
[INFO] ...: i love ros
[INFO] ...: ros 2 is cool
```
## License

本ソフトウェアは BSD 3-Clause License のもとで公開されています。
This software is released under the BSD 3-Clause License.

## Copyright
(c) 2025 Duong Huyen
