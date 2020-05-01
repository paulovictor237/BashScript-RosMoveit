#!/usr/bin/env bash

echo "Aguarde a instalação"

#Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# Set up your keys
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
#Installation
sudo apt update
sudo apt install ros-melodic-desktop-full
apt search ros-melodic
#Environment setup
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
#Dependencies for building packages
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
#Initialize rosdep
sudo apt install python-rosdep
sudo rosdep init
rosdep update
#MOVEIT
sudo apt-get install ros-melodic-moveit
#Getting Started
rosdep update
sudo apt-get update
sudo apt-get dist-upgrade
#ROS Build
sudo apt-get install ros-melodic-catkin python-catkin-tools
#Create A Catkin Workspace
mkdir -p ~/ws_moveit/src
cd ~/ws_moveit/src
wstool init .
wstool merge -t . https://raw.githubusercontent.com/ros-planning/moveit/master/moveit.rosinstall
wstool update -t .
#Build your Catkin Workspace
cd ~/ws_moveit/src
rosdep install -y --from-paths . --ignore-src --rosdistro melodic
cd ~/ws_moveit
catkin config --extend /opt/ros/melodic --cmake-args -DCMAKE_BUILD_TYPE=Release
catkin build
source ~/ws_moveit/devel/setup.bash
echo 'source ~/ws_moveit/devel/setup.bash' >> ~/.bashrc

echo "Instalação completa"
