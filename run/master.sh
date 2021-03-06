#!/usr/bin/env bash

DOCKER_IMAGE="sheaffej/b2-rosmaster"
LABEL="b2"
CONTAINER_NAME="rosmaster"

[ -z "$ROS_MASTER_URI" ] && echo "Please set ROS_MASTER_URI env" && exit 1

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

docker run -d --rm \
--name ${CONTAINER_NAME} \
--label ${LABEL} \
--net host \
--env ROS_MASTER_URI \
--mount type=bind,source=$MYDIR/../b2_rosmaster,target=/ros/src/b2_rosmaster \
--mount type=bind,source=$MYDIR/../../b2_description,target=/ros/src/b2_description \
$DOCKER_IMAGE roslaunch b2_rosmaster master.launch


