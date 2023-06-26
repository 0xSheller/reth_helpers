#!/bin/bash

# 1) Update the system
sudo apt-get update

# 2) Upgrade the system
sudo apt-get upgrade -y

# 3) Make another script executable
sudo chmod +x load_variables.sh
sudo chmod +x setup_nginx.sh
sudo chmod +x setup_prometheus.sh
sudo chmod +x setup_grafana.sh
sudo chmod +x setup_ufw.sh
sudo chmod +x setup_siren.sh
sudo chmod +x start_lighthouse.sh
sudo chmod +x start_reth.sh
sudo chmod +x start_erigon.sh
sudo chmod +x setup_wasabi.sh
sudo chmod +x snapshot.sh
sudo chmod +x restore.sh

# 4) Load the environment variables
source load_variables.sh

# 5) Make the dirs
sudo mkdir /chain
sudo mkdir /chain/$NODE_CLIENT
sudo mkdir /chain/$NODE_CLIENT/data
sudo mv /home/ubuntu/reth_helpers/start_reth.sh /chain/$NODE_CLIENT/

sudo mkdir /chain/lighthouse
sudo mkdir /chain/lighthouse/data
sudo mv /home/ubuntu/reth_helpers/start_lighthouse.sh /chain/lighthouse/

# 6) Add a cron job entry
(crontab -l ; echo "0 0 * * 0 /bin/bash ~/reth_helpers/snapshot.sh") | crontab -

# 7) Reboot the server
sudo reboot
