# SPDX-FileCopyrightText: 2025 Duong Huyen
# SPDX-License-Identifier: BSD-3-Clause

import launch
import launch_ros.actions
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration


def generate_launch_description():
    return launch.LaunchDescription([
        DeclareLaunchArgument(
            'target_word',
            default_value='ros',
            description='Word to filter'
        ),
        launch_ros.actions.Node(
            package='mypkg',
            executable='pattern_filter',
            name='pattern_filter',
            output='screen',
            parameters=[{'target_word': LaunchConfiguration('target_word')}],
        ),
    ])
