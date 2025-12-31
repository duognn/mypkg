# mypkg
[![test](https://github.com/duognn/mypkg/actions/workflows/test.yml/badge.svg)](https://github.com/duognn/mypkg/actions/workflows/test.yml)

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
 git clone [https://github.com/duognn/mypkg.git](https://github.com/duognn/mypkg.git)
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
$ ros2 run mypkg pattern_filter
```
Note: The default target word is "ros".

*Terminal 2: Publisher
Send text via standard input.
```bash
 echo "Hello ROS World" | ros2 run mypkg stream_publisher
```

## License

本ソフトウェアは BSD 3-Clause License のもとで公開されています。
This software is released under the BSD 3-Clause License.

## Copyright
(c) 2025 Duong Huyen
