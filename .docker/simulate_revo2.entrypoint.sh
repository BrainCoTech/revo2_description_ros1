#!/bin/bash

args=$*
shift $#

echo "args: $args"

source /ros_entrypoint.sh

cd /workspaces
catkin_make > /dev/null
source devel/setup.bash

# Default to left hand if no argument provided
hand=${args:-left}

if [ "$hand" = "left" ]; then
    roslaunch revo2_description gazebo_revo2_left_hand.launch
elif [ "$hand" = "right" ]; then
    roslaunch revo2_description gazebo_revo2_right_hand.launch
else
    echo "Usage: $0 [left|right]"
    echo "Default: left"
    exit 1
fi
