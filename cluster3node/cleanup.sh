#!/bin/bash

while true; do
    read -p "Do you wish to uninstall Redis Enterprise from your system?" yn
    case $yn in
        [Yy]* ) docker-compose down; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
