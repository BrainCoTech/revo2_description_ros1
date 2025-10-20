#!/bin/bash

# Check if Docker image exists, build if not
if ! docker image inspect revo2_description_ros1 >/dev/null 2>&1; then
    echo "Building revo2_description_ros1 Docker image..."
    docker build -t revo2_description_ros1 .docker
    echo "Docker image built successfully."
else
    echo "Using existing revo2_description_ros1 Docker image."
fi

echo

# docker run -it -u $(id -u) \
#     --privileged \
#     -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=${DISPLAY} \
#     -v $(pwd):/workspaces/src/revo2_description \
#     -w /workspaces/src/revo2_description \
#     revo2_description_ros1 \
#     .docker/visualize_revo2.entrypoint.sh $*

docker run -it --rm \
    --privileged \
    -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=${DISPLAY} \
    -v $(pwd):/tmp/revo2_description_src \
    -w /workspaces \
    revo2_description_ros1 \
    bash -c "mkdir -p /workspaces/src && cp -r /tmp/revo2_description_src /workspaces/src/revo2_description && exec /workspaces/src/revo2_description/.docker/visualize_revo2.entrypoint.sh $*"  
