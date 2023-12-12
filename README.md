# ERF Dog Challenge simulation framework

- Version 1.0.0

---

<div style="display:flex;">
<div style="flex:50%; padding-right:10px; border-right: 1px solid #dcdde1">

**Package summary**

A repository for ERF DOG Challenge. Used for build, test, and deployment for both the Navigation Track and the Locomotion Track 

- Maintainer status: maintained
- Maintainers
  - Michele Focchi
  - Gennaro Raiola
  - Andrea Pupa


</div>
<div style="flex:40%; padding-left:10px;">

**Table of Contents**
- [Overview](#overview)
- [Installation Steps](#installation-steps)

</div>
</div>

---

## Overview

<img src="images/eagleprojects.png" width=""/><img src="images/erf_logo.png" width="200"/>



This repository provides framework and the URDF for the challenge for simulation 

- You can find detailed informations about the challenge on the <a href="docs/rule.md">rule page </a>
- The supported robot for this simulation is Go1 from Unitree robotics. A real prototype of the robot (EDU version) is provided from EagleProjects to the teams that might need it. 

<img src="images/go1_robot.jpeg" width="300"/>



---

## Usage of the framework

### Navigation 

For the teams that are enrolled in the navigation track, we provide a simulation framework. The goal is to explore a maze and find an object in the shortest time possible. To use it we provide a framework designed by Gennaro Raiola called https://github.com/graiola/wolf-setup.git

- To use the framework you need just to launch this script:

```bash
./start_framework.sh
```

The first time you call this script it will take a bit longer (~5 minute) because a docker image with the code and its dependencies will be downloaded locally. The script spawns the robot into a maze that will be very similar to the one that you will find at the challenge. 

#### Sensor topics:

There are 5 stereo-cameras on 5 sides of the robot (face,left,right,chin,rearDown) that publish in the following namespaces:

```bash
/camera_chin_ir
/camera_face_ir
/camera_left_ir
/camera_rearDown_ir
/camera_right_ir
```

A LIDAR located on the top of the robot is publishing in this topic:

```bash
/rslidar_points
```

You can use the script argument `start_framework.sh -w ...` to select and load the maps of the desired track, please check the help options for details.

```bash
./start_framework.sh -h
```

Once the map and the robot are loaded, you can standup the robot by pressing the `enter` key on the virtual keyboard.
You can use this virtual keyboard to move the robot around.
To send twist commands to the robot you can use the following topic:

```bash
/wolf_controller/twist
```







### **Locomotion**

The map with of the race (with obstacles) is with the **locomotion.world** file. You can download and check map overview from <a href="doc/map.pdf" download>here</a>. 

The goal is to overpass all obstacles and reach the final destination in the shortest time possible. For details on the rule of the game, refer to the <a href="docs/rule.md">rule page </a> If you want to use the Go1 robot you can use this  [URDF description](https://github.com/graiola/wolf_description). For any clarification please open a Github issue on this repository. 

To load (in a Gazebo simulator) the  map contained in **locomotion.world**: 

- Append these commands in your .bashrc

```
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$HOME/DogChallengeFolder/models
export GAZEBO_RESOURCE_PATH=$GAZEBO_RESOURCE_PATH:$HOME/DogChallengeFolder/worlds
```

where **DogChallengeFolder** is the folder where you cloned this repository

- Spawn Gazebo simulation with this command:

```bash
roslaunch gazebo_ros empty_world.launch world_name:=locomotion.world
```

In this version, we only provide a method to import an SDF environment in a gazebo simulation. Alternatively, you can use your own framework and code to load the map model.

 


