#!/bin/bash

while true; do
    read -p "Do you wish to uninstall Redis Enterprise from your system?" yn
    case $yn in
        [Yy]* ) docker-compose down; docker volume rm crdb2node_redispers1; docker volume rm crdb2node_redispers2; docker volume rm crdb2node_redispers3; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
