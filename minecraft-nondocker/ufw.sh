#!/bin/bash

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 25565/tcp
sudo ufw enable
