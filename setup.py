from setuptools import find_packages, setup
import os
from glob import glob

package_name = 'simple_grep'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
        (os.path.join('share', package_name, 'launch'), glob('launch/*.launch.py')),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='duong',
    maintainer_email='bangtuthao@gmail.com',
    description='A simple distributed text filter using ROS 2 topics',
    license='BSD-3-Clause',
    extras_require={
        'test': [
            'pytest',
        ],
    },
    entry_points={
        'console_scripts': [
            'stream_publisher = simple_grep.stream_publisher:main',
            'pattern_filter = simple_grep.pattern_filter:main',
        ],
    },
)
