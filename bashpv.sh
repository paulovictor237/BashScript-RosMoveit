

# +---------------------------- Minhas Configuracoes ------------------------------+
# !! ROS FILES !!
# echo "-------------------------- Choose desired ROS distro -------------------------"
# echo " 1 - ros_melodic for melodic workspace"
# echo " 2 - ros_cristal for cristal workspace"
# echo "---------------------------------------END------------------------------------"

export ROS_DISTRO=melodic
source /opt/ros/melodic/setup.bash
source ~/catkin_ws/devel/setup.bash

ros_melodic()
{
  export ROS_DISTRO=melodic
  source /opt/ros/melodic/setup.bash
  source ~/catkin_ws/devel/setup.bash
}

ros_cristal()
{
  export ROS_DISTRO=crystal
  source /opt/ros/crystal/setup.bash
}

# !! COMANDOS !!
alias usb_config='sudo chmod 777 /dev/ttyUSB0'
alias ros_path='echo $ROS_PACKAGE_PATH'
alias moveit_new='roslaunch moveit_setup_assistant setup_assistant.launch'
alias bash_update='source ~/.bashrc'
# !! FUNCOES !!
function urdf_view {
  roslaunch urdf_tutorial display.launch model:=$1
}
function xacro_to_graphiz {
  urdf_to_graphiz <(xacro --inorder $1)
}
function check_xacro {
  check_urdf <(xacro --inorder $1)
}
function generate_urdf {
	rosrun xacro xacro --inorder -o "$1.urdf" "$1.xacro"
}
function pv_help { printf "
╔══════════════════════════════════════════════════╗
║                     COMANDOS                     ║
╠════════════════════╦═════════════════════════════╣
║ $ ros_melodic      ║ Melodic Workspace           ║
╠════════════════════╬═════════════════════════════╣
║ $ ros_cristal      ║ Cristal Workspace           ║
╠════════════════════╬═════════════════════════════╣
║ $ usb_config       ║ Ativa a configuracao USB    ║
╠════════════════════╬═════════════════════════════╣
║ $ ros_path         ║ Caminhos dos pacotes ROS    ║
╠════════════════════╬═════════════════════════════╣
║ $ moveit_new       ║ Cria um novo pacote Moveit  ║
╠════════════════════╬═════════════════════════════╣
║ $ bash_update      ║ Atualiza o bash             ║
╠════════════════════╬═════════════════════════════╣
║ $ urdf_view        ║ Visualizar o URDF em 3D     ║
╠════════════════════╬═════════════════════════════╣
║ $ xacro_to_graphiz ║ Cria um grafico em PDF      ║
╠════════════════════╬═════════════════════════════╣
║ $ check_xacro      ║ Verificar erros no xacro    ║
╠════════════════════╬═════════════════════════════╣
║ $ generate_urdf    ║ Gera um novo URDF           ║
╠════════════════════╬═════════════════════════════╣
║ $ pv_help          ║ Imprime a lista de comandos ║
╚════════════════════╩═════════════════════════════╝
"
}
# !! OUTROS !!

