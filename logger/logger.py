#!/usr/bin/env python2

import rospy
import os
import time
from datetime import datetime
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2

# Sul cane ci sara la cartella ERF_LOG
# Dalla suddetta cartella verra lanciato, specificando Team e Challenge:
# ESEMPIO --> roslaunch start logger.launch teamName:=unipg challengeType:=navigation

cv_image = None

class LoggerNode:
    def __init__(self):
        rospy.init_node('logger_node')
        rospy.on_shutdown(self.on_shutdown)
        
        # Specify parameters
        self.teamName = rospy.get_param('~teamName')  
        self.challengeType = rospy.get_param('~challengeType')  
        
        # Log folder creation
        self.log_folder = self.teamName + "_" + self.challengeType 
        # Path to save log and frames 
        self.output_path = '/home/unitree/Desktop/ERF_LOG/' + self.log_folder
        if not os.path.exists(self.output_path):
            os.makedirs(self.output_path)

        self.log_file = None
        self.recognized_objects = []
        self.elapsed_time = 0
        
        # Create a CvBridge object to convert ROS Image messages to OpenCV images
        self.bridge = CvBridge()

        # Subscribe to the camera video topic - this is ok for Realsense
        rospy.Subscriber('/camera/color/image_raw', Image, self.image_callback)
        # Subscribe to the recognized objects topic
        rospy.Subscriber("/recognized_class", String, self.object_callback)

        rospy.loginfo("Logger node initialized\n")

    def object_callback(self, data):
        timestamp = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
        if self.challengeType == "NAVIGATION" or self.challengeType == "navigation":
            recognition_info = timestamp + " - '" + data.data + "' recognized by '" + self.teamName + "'\n" # it will be the image name
            rospy.loginfo(recognition_info)
           
            # Save frame           
            image_filename = os.path.join(self.output_path, timestamp + "_" + data.data + "_" + self.teamName + ".png")
            cv2.imwrite(image_filename, cv_image)
            
            self.recognized_objects.append((timestamp, data.data))          
            self.log_file.write(recognition_info)

    def image_callback(self, msg):
        global cv_image

        try:
            # Convert ROS Image message to OpenCV image
            cv_image = self.bridge.imgmsg_to_cv2(msg, "bgr8")
        except Exception as e:
            rospy.logerr("Error processing image: {}".format(e))
            return

    def get_log_filename(self):
        timestamp = time.strftime("%Y-%m-%d_%H:%M:%S", time.localtime())
        log_filename = timestamp + "_" + self.teamName + "_" + self.challengeType 

        return log_filename

    def log_start(self):
        self.start_timestamp = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())       
        rospy.loginfo("Start: %s\n" % self.start_timestamp)
        
        self.log_file = open(self.output_path + "/" + self.get_log_filename() + ".txt", "a")
        
        self.log_file.write(self.start_timestamp + " - start\n")
    
    def log_end(self):
        self.end_timestamp = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
        rospy.loginfo("End: %s\n" % self.end_timestamp)
    
        self.log_file.write(self.end_timestamp + " - end\n")
        
        self.elapsed_time = self.calculate_time_difference()

        self.log_file.write("Elapsed time - " + str(self.elapsed_time) + "\n")

        rospy.loginfo("Elapsed time: %s\n" % self.elapsed_time)

        self.log_file.close()

    def on_shutdown(self):
        if self.log_file is not None:
            self.log_end()
        rospy.loginfo("Logger node shutting down")
        
    def calculate_time_difference(self):
        start_time = datetime.strptime(self.start_timestamp, "%Y-%m-%d %H:%M:%S")
        end_time = datetime.strptime(self.end_timestamp, "%Y-%m-%d %H:%M:%S")
        return end_time - start_time
    

if __name__ == '__main__':
    try:
        logger = LoggerNode()
        logger.log_start()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
