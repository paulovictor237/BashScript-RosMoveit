

# +---------------------------- Minhas Configuracoes -----------------------------+
#              ╔══════════════════════════════════════════════════╗
#              ║  Copyright (C) 2020 Paulo Victor Duarte          ║
#              ║  Atalhos e comandos para auxiliar no uso do ROS  ║
#              ╚══════════════════════════════════════════════════╝
# +-------------------------------------------------------------------------------+

# !! DIRETORIOS !!
export LC_NUMERIC=en_US.UTF-8
export ROS_DISTRO=melodic
source /opt/ros/melodic/setup.bash
source ~/ws_moveit/devel/setup.bash

# !! COMANDOS !!
alias usb_config='sudo chmod 777 /dev/ttyUSB0'
alias ros_path='echo $ROS_PACKAGE_PATH'
alias moveit_new='roslaunch moveit_setup_assistant setup_assistant.launch'
alias bash_update='source ~/.bashrc'

# !! FUNCOES !!
function urdf_view {
  roslaunch urdf_tutorial display.launch model:=$1
}
function xacro_to_pdf {
  urdf_to_graphiz <(xacro --inorder $1)
}
function check_xacro {
  check_urdf <(xacro --inorder $1)
}
function xacro_to_urdf {
  echo "Entre com o nome do arquivo URDF"
  read nome
  echo "Criado arquivo, $nome.urdf"
  rosrun xacro xacro $1 > $nome.urdf
}
function pv_help { printf "
╔══════════════════════════════════════════════════╗
║                     COMANDOS                     ║
╠════════════════════╦═════════════════════════════╣
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
║ $ xacro_to_pdf     ║ Cria um grafico em PDF      ║
╠════════════════════╬═════════════════════════════╣
║ $ check_urdf       ║ Verificar erros no urdf     ║
╠════════════════════╬═════════════════════════════╣
║ $ check_xacro      ║ Verificar erros no xacro    ║
╠════════════════════╬═════════════════════════════╣
║ $ xacro_to_urdf    ║ Converte um XACRO para URDF ║
╠════════════════════╬═════════════════════════════╣
║ $ rqt_graph        ║ Mapeamento entre os Nodes   ║
╠════════════════════╬═════════════════════════════╣
║ $ pv_help          ║ Imprime a lista de comandos ║
╚════════════════════╩═════════════════════════════╝
"
}
# +----------------------------------- THE END -----------------------------------+

