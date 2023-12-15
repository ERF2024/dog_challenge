cmake_minimum_required(VERSION 3.0.2)
project(dog_challenge)

find_package(catkin REQUIRED)

catkin_package(
)

include_directories(
)

install(DIRECTORY launch/
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/launch
  PATTERN ".svn" EXCLUDE)

install(DIRECTORY models/
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/models
  PATTERN ".svn" EXCLUDE)

install(DIRECTORY worlds/
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/worlds
  PATTERN ".svn" EXCLUDE)

install(DIRECTORY plugins/
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/plugins
  PATTERN ".svn" EXCLUDE)
