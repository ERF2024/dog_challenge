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

<img src="images/eagleprojects.png" width=""/><img src="images/erf_logo.png" width="300"/>



This repository provides framework and the URDF for the challenge for simulation 

- You can download and check map overview from <a href="doc/map.pdf" download>here</a>.
- You can find information about the challenge on the <a href="docs/rule.md">rule page </a>
- The supported robot for this simulation is Go1 from Unitree robotics







---

## Installation Steps

For the teams that are enrolled in the navigation track, we provide a simulation framework. The goal is to explore a maze and find an object in the shortest time possible. 



export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$HOME/ros_ws/src/DogChallenge/models
export GAZEBO_RESOURCE_PATH=$GAZEBO_RESOURCE_PATH:$HOME/ros_ws/src/DogChallenge/worlds 











Usage







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


In this version, we only provide a method to import the urdf environment from gazebo simulation. If you want to use another simulator, import `urdf/map.urdf` directly