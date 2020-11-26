#!/usr/bin/env bash

echo "+--------------------------------------------------+"
echo "╔══════════════════════════════════════════════════╗"
echo "║  Copyright (C) 2020 Paulo Victor Duarte          ║"
echo "╚══════════════════════════════════════════════════╝"
echo "+--------------------------------------------------+"
echo "Bem vindo ao bash-script ROS2 Foxy Fitzroy + MoveIt"
echo "Digite sua senha para iniciar o bash-script"
sudo echo "instalacao iniciada"
sudo apt update
sudo apt install git -y
echo "+--------------------------------------------------+"
echo "Instalar os comandos bash"
# "sudo cat arquivos/bashpv.sh >> ~/.bashrc
echo "+------------------ ROS2 MoveIt -------------------+" >> ~/.bashrc
echo "export LC_NUMERIC="en_US.UTF-8"" >> ~/.bashrc
echo "export LANG=en_US.UTF-8" >> ~/.bashrc
echo "export ROS_DISTRO=foxy" >> ~/.bashrc
echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
echo "source ~/ws_ros2/install/setup.bash" >> ~/.bashrc
echo "export COLCON_WS=~/ws_ros2/" >> ~/.bashrc
echo "+---------------------- END -----------------------+" >> ~/.bashrc
source ~/.bashrc
echo "+--------------------------------------------------+"
echo "|                 ROS Instalation                  |"
echo "+--------------------------------------------------+"
# locale  # check for UTF-8
# sudo apt update && sudo apt install locales
# sudo locale-gen en_US en_US.UTF-8
# sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
# export LANG=en_US.UTF-8
# locale  # verify settings
# echo "+--------------------------------------------------+"
echo "Setup Sources"
sudo apt install git -y
sudo apt update && sudo apt install curl gnupg2 lsb-release -y
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'
echo "+--------------------------------------------------+"
echo "Install ROS 2 packages"
sudo apt update
sudo apt install ros-foxy-desktop -y
source /opt/ros/foxy/setup.bash
echo "+--------------------------------------------------+"
echo "Install argcomplete (optional)"
sudo apt install -y python3-pip
pip3 install -U argcomplete
source /opt/ros/foxy/setup.bash
echo "+--------------------------------------------------+"
echo "Install ROS2 Build Tools"
sudo apt update && sudo apt install -y \
  build-essential \
  cmake \
  git \
  libbullet-dev \
  python3-colcon-common-extensions \
  python3-flake8 \
  python3-pip \
  python3-pytest-cov \
  python3-rosdep \
  python3-setuptools \
  python3-vcstool \
  wget
echo "install some pip packages needed for testing"
python3 -m pip install -U \
  argcomplete \
  flake8-blind-except \
  flake8-builtins \
  flake8-class-newline \
  flake8-comprehensions \
  flake8-deprecated \
  flake8-docstrings \
  flake8-import-order \
  flake8-quotes \
  pytest-repeat \
  pytest-rerunfailures \
  pytest
echo "install Fast-RTPS dependencies"
sudo apt install --no-install-recommends -y \
  libasio-dev \
  libtinyxml2-dev
echo "install Cyclone DDS dependencies"
sudo apt install --no-install-recommends -y \
  libcunit1-dev
echo "+--------------------------------------------------+"
# ==============================================================
echo "Get ROS 2 code - Create a workspace and clone all repos:"
mkdir -p ~/ws_ros2/src
cd ~/ws_ros2
wget https://raw.githubusercontent.com/ros2/ros2/foxy/ros2.repos
vcs import src < ros2.repos
echo "+--------------------------------------------------+"
echo "Install dependencies using rosdep"
sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro foxy -y --skip-keys "console_bridge fastcdr fastrtps rti-connext-dds-5.3.1 urdfdom_headers"
echo "+--------------------------------------------------+"
echo "Build the code in the workspace"
cd ~/ws_ros2/
colcon build --symlink-install
# ==============================================================
echo "+--------------------------------------------------+"
echo "|                MoveIt Instalation                |"
echo "+--------------------------------------------------+"
# echo "Create Workspace and Source - Create a colcon workspace:"
# export COLCON_WS=~/ws_ros2/
# mkdir -p $COLCON_WS/src
# cd $COLCON_WS/src
cd ~/ws_ros2/src
echo "+--------------------------------------------------+"
echo "Download Source Code - Download the repository and install any dependencies:"
wget https://raw.githubusercontent.com/ros-planning/moveit2/main/moveit2.repos
vcs import < moveit2.repos
rosdep install -r --from-paths . --ignore-src --rosdistro foxy -y
echo "+--------------------------------------------------+"
echo "Build MoveIt - Configure and build the workspace:"
cd $COLCON_WS
colcon build --event-handlers desktop_notification- status- --cmake-args -DCMAKE_BUILD_TYPE=Release
echo "Source the Colcon Workspace"
source $COLCON_WS/install/setup.bash
echo "+--------------------------------------------------+"
echo "--------------- Instalação completa ----------------"
echo " 1 - Seu ROS2 workspace foi criado na pasta:"
echo " > ~/ws_ros2"
echo " 2 - Novos comandos foram adicionados ao seu:"
echo " > ~/.bashrc"
echo "----------------------- END ------------------------"
exit 1
# FIM
