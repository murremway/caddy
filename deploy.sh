#!/bin/bash

    ## Install using the repository:
    sudo su -
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    ## Add Dockers official GPG key & stable repo
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    ## Install Docker latest
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
    sudo service docker start
    ## curl -fsSL https://get.docker.com -o get-docker.sh
    ## sudo sh get-docker.sh
    echo "starting the installation of docker-compose ...."
    echo " "
    sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker pull murremway/yinka-app
    docker run -itd -p 3001:80 439af64db489
    echo " "
    echo "Validating the versions Installed"
    echo "`docker -v` - is installed Successfully"
    echo "`docker-compose -v` - is installed Successfully"
    exit 0
