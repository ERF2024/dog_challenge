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


```
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$HOME/ros_ws/src/DogChallenge/models
export GAZEBO_RESOURCE_PATH=$GAZEBO_RESOURCE_PATH:$HOME/ros_ws/src/DogChallenge/worlds
```



The first time you call this script it will take a bit longer (<1 minute) because a docker image with the code and its dependencies will be downloaded locally. The script spawns the robot into a maze that will be very similar to the one that you will: 





```
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$HOME/ros_ws/src/DogChallenge/models
export GAZEBO_RESOURCE_PATH=$GAZEBO_RESOURCE_PATH:$HOME/ros_ws/src/DogChallenge/worlds
```







#### Sensor topics:

There are 4 Realsense stereo-cameras on the 4 sides of the robot that publish in the following topics:

```bash
/point_cloud_left
/point_cloud_right
...
```

A LIDAR located on the back is publishing in this topic:

```bash
/rslidar_points
```




You can use the launch argument to select and load only maps of the desired track.

```bash
roslaunch ERFDogChallenfe course:=navigation # or locomotion 
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

 


