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
-w,--world \tWorld name [default=navigation|locomotion], example: -w navigation
\n
-v,--volume \tMounted folder [default=$HOME/ros_ws], example: -v $HOME/ros_ws
\n
-o,--odom \tPublish the robot odom as a TF frame [default=true], example: -o true"

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
ODOM=true
MOUNTED_CODE_VOLUME=$HOME/ros_ws

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
	 -v|--volume)
		MOUNTED_CODE_VOLUME="$2"
		shift
		;;
	-o|--odom)
		ODOM="$2"
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
WORLD_FILE=/home/root/ros_ws/src/dog_challenge/worlds/$WORLD_NAME/$WORLD_NAME.world
GAZEBO_GUI=true
SENSORS=true
INITIAL_XYZ=[0.0,0.0,1.0]
INITIAL_RPY=[0.0,0.0,0.0]
NET=host
GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/$ROS/share/wolf_gazebo_resources/models/:/home/root/ros_ws/src/dog_challenge/models
GAZEBO_RESOURCE_PATH=$GAZEBO_RESOURCE_PATH:/home/root/ros_ws/src/dog_challenge/worlds/$WORLD_NAME

# Checks
if [[ ( $WORLD_NAME == "navigation") || ( $WORLD_NAME == "locomotion") ]] 
then 
	echo "Selected world: $WORLD_NAME"
else
	echo "Wrong world option!"
	echo -e $USAGE
	exit 0
fi

# Set initial pose based on the selected world
if [[ ( $WORLD_NAME == "navigation") ]]
then 
	INITIAL_XYZ=[-0.2,-9.8,1.0]
	INITIAL_RPY=[0.0,0.0,0]
fi
if [[ ( $WORLD_NAME == "locomotion") ]]
then
	INITIAL_XYZ=[1.0,0.0,1.0]
	INITIAL_RPY=[0.0,0.0,-3.14]
fi

# Define the image name
IMAGE_NAME=serger87/$CONTAINER_NAME:$IMAGE_TAG

# Add docker to xhost
xhost +local:docker

if [ `sudo systemctl is-active docker` = "inactive" ]; then
  echo "Docker inactive. Starting docker..."
  sudo systemctl start docker
fi


#be sure there is no update on the image
docker pull $IMAGE_NAME

# Cleanup the docker container before launching it
docker rm -f $CONTAINER_NAME > /dev/null 2>&1 || true 

docker run --user root:root --hostname $HOSTNAME --net=$NET --device=/dev/dri:/dev/dri --privileged -e "QT_X11_NO_MITSHM=1" -e GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH -e GAZEBO_RESOURCE_PATH=$GAZEBO_RESOURCE_PATH -e SHELL -e DISPLAY -e DOCKER=1  --name $CONTAINER_NAME \
	--gpus all \
	--device=/dev/ttyUSB0 \
	--volume="/tmp:/tmp:rw" \
		 --volume "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
		 	 -e "QT_X11_NO_MITSHM=1" \
	--volume="$SCRIPTPATH:/home/root/ros_ws/src/dog_challenge:rw" \
	--volume="$MOUNTED_CODE_VOLUME:/home/root/ros_ws:rw"\
        -it $IMAGE_NAME $SHELL -c "source /opt/ros/$ROS/setup.bash; source /opt/xbot/setup.sh; roslaunch /home/root/ros_ws/src/dog_challenge/launch/start_framework.launch robot_name:=$NAMESPACE robot_model:=$ROBOT_MODEL publish_odom_tf:=$ODOM  sensors:=$SENSORS gazebo_gui:=$GAZEBO_GUI initial_xyz:=$INITIAL_XYZ initial_rpy:=$INITIAL_RPY world_file:=$WORLD_FILE"
   
