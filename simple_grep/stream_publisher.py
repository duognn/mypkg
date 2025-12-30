# SPDX-FileCopyrightText: 2025 duong
# SPDX-License-Identifier: BSD-3-Clause

import rclpy
from rclpy.node import Node
from std_msgs.msg import String
import sys

class StreamPublisher(Node):
    def __init__(self):
        super().__init__('stream_publisher')
        self.pub = self.create_publisher(String, 'text_stream', 10)

    def run(self):
        try:
            for line in sys.stdin:
                msg = String()
                msg.data = line.strip() 
                self.pub.publish(msg)
        except KeyboardInterrupt:
            pass

def main():
    rclpy.init()
    node = StreamPublisher()
    node.run()
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
