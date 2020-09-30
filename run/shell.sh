#!/usr/bin/env bash

DOCKER_IMAGE="sheaffej/b2-rosmaster"
LABEL="b2"

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DOWNLOADS_DIR=~/Downloads

docker run -it --rm \
--label ${LABEL} \
--net host \
--env DISPLAY \
--env ROS_MASTER_URI \
--mount type=bind,source=$MYDIR/../b2_rosmaster,target=/ros/src/b2_rosmaster \
--mount type=bind,source=$MYDIR/../../b2_description,target=/ros/src/b2_description \
$DOCKER_IMAGE $@

