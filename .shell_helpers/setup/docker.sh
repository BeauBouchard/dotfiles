#!/usr/bin/env bash

docker_install_check() {
  which docker

  if [ $? -eq 0 ]
  then
      docker --version | grep "Docker version"
      if [ $? -eq 0 ]
      then
          echo "docker installed"
      else
          echo "installing docker"
      fi
  else
      echo "installing docker" >&2
  fi
}

docker_install() {

}

# allows current user to access docker
docker_permissions_current_user() {
  sudo gpasswd -a $USER docker
  # sudo addgroup --system docker
  # sudo adduser $USER docker
  newgrp docker
}

docker_compose_install_check() {
  which docker-compose

  if [ $? -eq 0 ]
  then
      docker-compose --version | grep "docker-compose version"
      if [ $? -eq 0 ]
      then
          echo "docker installed"
      else
          echo "installing docker-compose"
      fi
  else
      echo "installing docker-compose" >&2
  fi
}

docker_compose_install() {
  sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
}

# allows current user to access docker-compose
docker_compose_perms() {
  sudo chmod +x /usr/local/bin/docker-compose
}
