# simple_grep

[![Build Status](https://github.com/duognn/simple_grep/actions/workflows/test.yml/badge.svg)](https://github.com/duognn/simple_grep/actions/workflows/test.yml)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

---

## 概要 / Overview

**simple_grep** は、Publisher / Subscriber パターンを用いた分散テキストフィルタリングシステムを実装する ROS 2（Python）パッケージです。
**simple_grep** is a ROS 2 (Python) package that implements a *distributed text filtering system* using the Publisher/Subscriber model.

本パッケージは、ROS 2 の基本機能（ノード、トピック、パラメータ、Launch ファイル）を 理解することを目的とした学習用サンプルです。
This package is designed as a learning example to demonstrate 
core ROS 2 concepts such as nodes, topics, parameters, and launch files.

---

## システム構成 / System Architecture

| ノード名 / Node | 役割 / Role | 説明 / Description | トピック・パラメータ |
|----------------|------------|--------------------|---------------------|
| `stream_publisher` | Publisher | 標準入力からテキストを読み取り、トピックに配信します。 | **Pub:** `/text_stream` (`std_msgs/String`) |
| `pattern_filter` | Subscriber | 指定したキーワードに基づいてテキストをフィルタリングします。 | **Sub:** `/text_stream`<br>**Param:** `target_word`（default: `"ros"`） |

---

## 使用方法 / Usage

### 1. ビルドとセットアップ / Build & Setup
```bash
colcon build --packages-select simple_grep
source install/setup.bash
```

### 2. Launch ファイルで実行（例）/ Using Launch File (Example)
```bash
# デフォルトキーワード: "ros"
# Default keyword: "ros"
ros2 launch simple_grep grep.launch.py

# カスタムキーワード
# Custom keyword
ros2 launch simple_grep grep.launch.py target_word:=hello
```
### 3. 手動実行（別ターミナル）/ Manual Execution
ターミナル 1 / Terminal 1（Publisher）:
```bash
ros2 run simple_grep stream_publisher
```
ターミナル 2 / Terminal 2（Filter）:
```bash
ros2 run simple_grep pattern_filter --ros-args -p target_word:=hello
```
標準入力に入力したテキストのうち、
キーワードを含む行のみが表示されます。
Only lines containing the target keyword
will be displayed in the filter node.

---

## ライセンス / License

本ソフトウェアは BSD 3-Clause License のもとで公開されています。  
This software is released under the BSD 3-Clause License.
