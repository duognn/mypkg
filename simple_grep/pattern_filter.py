# SPDX-FileCopyrightText: 2025 duong
# SPDX-License-Identifier: BSD-3-Clause

import rclpy
from rclpy.node import Node
from std_msgs.msg import String


class PatternFilter(Node):
    def __init__(self):
        super().__init__('pattern_filter')
        self.declare_parameter('target_word', 'ros')
        self.subscription = self.create_subscription(
            String,
            'text_stream',
            self.listener_callback,
            10)
        self.subscription

    def listener_callback(self, msg):
        target = \
            self.get_parameter('target_word').get_parameter_value().string_value
        if target in msg.data:
            print(msg.data, flush=True)


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
