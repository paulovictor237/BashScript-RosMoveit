# BashScript Ros-Moveit

Este BashScript  foi desenvolvido com a versão recomendada (2020) ROS1 Melodic Morenia para a distribuição Linux Ubuntu Budgie 18.04 LTS, e compilado com a extensão catkin-tools (catkin build). Vale o registro que a última versão do ROS1 será a Noetic Ninjemys, mas no momento se encontra em fase Beta. Existe também o projeto Moveit 2 para o ROS2, porém ainda está em processo de migração.

# A. Requisitos de software

1. Linux Ubuntu 18.04 LTS

# B. Modo de operação

Este bash-script faz os seguintes passos:
1. Adiciona comandos ao arquivo "~/.bashrc"
2. Instala o ROS Melodic Morenia
3. Instala o MoveIt Melodic 1.0 LTS
4. Cria um *workspace* na pasta "~/ws_moveit"
5. Compila o *workspace* com o **catkin build**

# C. Instalação

1. Faça o Download do arquivo e descopacte a pasta
2. Dentro da pasta de arquivos abra o terminal
3. Digite  ```$ bash bash_script_ros.sh```
4. A instalação pode demorar até 40 minutos, aguarde...
5. Para abrir a lista dos novos comandos digite  ```$ peve_help```
6. Ao finalizar o programa estará pronto para executar os tutoriais do [Moveit](https://ros-planning.github.io/moveit_tutorials).

**Copyright &copy; 2020, Paulo Victor Duarte, All rights reserved.**
