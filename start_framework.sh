#!/usr/bin/env bash

# Get this script's path
pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd`
popd > /dev/null

set -e

USAGE="Usage: \n start_framework [OPTIONS...] 
\n\n
Help Options:
\n 
-h,--help \tShow help options
\n\n
Application Options:
\n 
-n,--namespace \tDefine the ROS namespace [default=], example: -n robot_1
\n 
-w,--world \tWorld name [default=navigation], example: -w navigation"

echo ' 
###########################################
#                                         #
#                  WoLF                   #
#                                         #
#  https://github.com/graiola/wolf-setup  #
#                       .                 #
#                      / V\               #
#                    / .  /               #
#                   <<   |                #
#                   /    |                #
#                 /      |                #
#               /        |                #
#             /    \  \ /                 #
#            (      ) | |                 #
#    ________|   _/_  | |                 #
#  <__________\______)\__)                #
#                                         #
###########################################
'

if [[ ( $1 == "--help") ||  $1 == "-h" ]] 
then 
	echo -e $USAGE
	exit 0
fi

# Default
NAMESPACE=
WORLD_NAME=navigation

while [ -n "$1" ]; do # while loop starts

	case "$1" in

         -n|--namespace)
		NAMESPACE="$2"
		shift
		;;

	 -w|--world)
		WORLD_NAME="$2"
		shift
		;;

	*) echo "Option $1 not recognized!" 
		echo -e $USAGE
		exit 0;;

	esac

	shift
done

# Options (Do not modify them!)
ROS=noetic
CONTAINER_NAME="wolf-app"
IMAGE_TAG="focal"
ROBOT_MODEL=go1
WORLD_FILE=/home/root/dog_challenge/worlds/$WORLD_NAME.world
GAZEBO_GUI=true
SENSORS=true
INITIAL_XYZ=[0.0,0.0,1.0]
NET=host
GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/$ROS/share/wolf_gazebo_resources/models/:/home/root/dog_challenge/models
GAZEBO_RESOURCE_PATH=$GAZEBO_RESOURCE_PATH:/home/root/dog_challenge/worlds

# Checks
if [[ ( $WORLD_NAME == "navigation") ]] 
then 
	echo "Selected world: $WORLD_NAME"
else
	echo "Wrong world option!"
	echo -e $USAGE
	exit 0
fi

# Define the image name
IMAGE_NAME=serger87/$CONTAINER_NAME:$IMAGE_TAG

# Add docker to xhost
xhost +local:docker

if [ `sudo systemctl is-active docker` = "inactive" ]; then
  echo "Docker inactive. Starting docker..."
  sudo systemctl start docker
fi

# Cleanup the docker container before launching it
docker rm -f $CONTAINER_NAME > /dev/null 2>&1 || true 

docker run --user root:root --hostname $HOSTNAME --net=$NET --device=/dev/dri:/dev/dri --privileged -e "QT_X11_NO_MITSHM=1" -e GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH -e GAZEBO_RESOURCE_PATH=$GAZEBO_RESOURCE_PATH -e SHELL -e DISPLAY -e DOCKER=1 --name $CONTAINER_NAME \
	--gpus all \
	--device=/dev/ttyUSB0 \
	--volume="/tmp:/tmp:rw" \
	--volume="$SCRIPTPATH:/home/root/dog_challenge:rw" \
        -it $IMAGE_NAME $SHELL -c "source /opt/ros/$ROS/setup.bash; source /opt/xbot/setup.sh; roslaunch wolf_controller wolf_controller_bringup.launch robot_name:=$NAMESPACE robot_model:=$ROBOT_MODEL sensors:=$SENSORS gazebo_gui:=$GAZEBO_GUI initial_xyz:=$INITIAL_XYZ world_file:=$WORLD_FILE"
