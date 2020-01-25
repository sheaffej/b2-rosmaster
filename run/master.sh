#!/usr/bin/env bash

DOCKER_IMAGE=ros:melodic-ros-core-bionic
ROS_PORT=11311

docker run -d --rm \
--name rosmaster \
--net host \
$DOCKER_IMAGE roscore -p $ROS_PORT
