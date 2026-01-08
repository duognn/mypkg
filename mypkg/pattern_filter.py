# SPDX-FileCopyrightText: 2025 Duong Huyen
# SPDX-License-Identifier: BSD-3-Clause

import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class PatternFilter(Node):
    def __init__(self):
        super().__init__('pattern_filter')
        self.sub = self.create_subscription(String, 'text_stream', self.cb, 10)
        self.pub = self.create_publisher(String, 'filtered_text', 10)
        
        self.declare_parameter('target_word', 'ros')

    def cb(self, msg):
        target = self.get_parameter('target_word').get_parameter_value().string_value
        if target in msg.data:
            out_msg = String()
            out_msg.data = msg.data
            self.pub.publish(out_msg)
            self.get_logger().info(f"Forwarded: {msg.data}")

def main():
    rclpy.init()
    node = PatternFilter()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
