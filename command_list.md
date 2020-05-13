| Comandos      | Descrição                         | Comandos completos                                      |
|---------------|-----------------------------------|---------------------------------------------------------|
| usb_config    | Ativa a configuracao USB          | sudo chmod 777 /dev/ttyUSB0                             |
| ros_path      | Caminhos dos pacotes ROS          | echo $ROS_PACKAGE_PATH                                  |
| moveit_new    | Cria um novo pacote Moveit        | roslaunch moveit_setup_assistant setup_assistant.launch |
| bash_update   | Atualiza o bash                   | source ~/.bashrc                                        |
| urdf_view     | Visualizar o URDF em 3D roslaunch | urdf_tutorial display.launch model:=$1                  |
| xacro_to_pdf  | Cria um grafico em PDF            | urdf_to_graphiz <(xacro --inorder $1)                   |
| check_urdf    | Verificar erros no urdf           | check_urdf                                              |
| check_xacro   | Verificar erros no xacro          | check_urdf <(xacro --inorder $1)                        |
| xacro_to_urdf | Converte um XACRO para URDF       | rosrun xacro xacro $1 > $nome.urdf    |
| rqt_graph     | Mapeamento entre os Nodes         | rqt_graph                                               |
| pv_help       | Imprime a lista de comandos       | printf ".."                                             |