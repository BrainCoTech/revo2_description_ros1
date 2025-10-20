FROM osrf/ros:noetic-desktop

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /workspaces

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ros-noetic-xacro \
    ros-noetic-joint-state-publisher-gui \
    ros-noetic-gazebo-ros-pkgs \
    ros-noetic-gazebo-ros-control \
    ros-noetic-ros-control \
    ros-noetic-ros-controllers \
    && rm -rf /var/lib/apt/lists/*

RUN echo "source /ros_entrypoint.sh" >>~/.bashrc
RUN echo "export ROS_MASTER_URI=http://localhost:11311" >>~/.bashrc
