#!/usr/bin/env bash

DOCKER_IMAGE="ros:melodic-ros-core-bionic"
CONTAINER_NAME="rosmaster"
LABEL="b2"
ROS_PORT=11311

docker run -d --rm \
--name ${CONTAINER_NAME} \
--label ${LABEL} \
--net host \
$DOCKER_IMAGE roscore -p $ROS_PORT
