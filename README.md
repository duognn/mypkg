# mypkg
[![Build Status](https://github.com/duognn/simple_grep/actions/workflows/test.yml/badge.svg)](https://github.com/duognn/simple_grep/actions/workflows/test.yml)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

A ROS 2 package for text filtering.
---
## Description
This package reads text from stdin, filters lines containing a keyword, and republishes them.
### Nodes and Topics
| Node | Role | Input Topic | Output Topic |
| --- | --- | --- | --- |
| `stream_publisher` | Reads stdin and publishes | N/A | `/text_stream` (String) |
| `pattern_filter` | Filters text by keyword | `/text_stream` | `/filtered_text` (String) |
---
## Requirement
* ROS 2 Humble
* Python 3.10
---
## Usage
### 1. Build
Clone the repository into your workspace `src` directory and build it.
(e.g. `cd ~/ros2_ws/src`):
```bash
cd <your_ros2_workspace>/src
git clone https://github.com/duognn/mypkg.git
cd ..
colcon build --packages-select mypkg
source install/setup.bash
```
---
### 2. Run

*Terminal 1: Filter
```bash
ros2 run mypkg pattern_filter --ros-args -p target_word:="ros"
```
*Terminal 2: Terminal 2 (Monitor Result):
```bash
ros2 topic echo /filtered_text
```
*Terminal 3 (Input):
```bash
echo "hello ros world" | ros2 run mypkg stream_publisher
```
## License

本ソフトウェアは BSD 3-Clause License のもとで公開されています。
This software is released under the BSD 3-Clause License.

## Copyright
(c) 2025 Duong Huyen
