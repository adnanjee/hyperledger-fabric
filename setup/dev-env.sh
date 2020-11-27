#!/bin/bash

# Install nvm dependencies
echo "# Installing nvm dependencies"
sudo apt-get -y install build-essential libssl-dev

# Execute nvm installation script
echo "# Executing nvm installation script"
bash nvm.sh

# Set up nvm environment without restarting the shell
export NVM_DIR="${HOME}/.nvm"
[ -s "${NVM_DIR}/nvm.sh" ] && . "${NVM_DIR}/nvm.sh"
[ -s "${NVM_DIR}/bash_completion" ] && . "${NVM_DIR}/bash_completion"

# Install node
echo "# Installing nodeJS"
nvm install 14.15.1
nvm alias default 14.15.1

# Ensure that CA certificates are installed
sudo apt-get -y install apt-transport-https ca-certificates

# Install python v2 and v3 

sudo apt-get install -y python
sudo apt-get install -y python3
   

source ~/.profile
source ~/.bashrc

# Print installation details for user
echo ''
echo 'Installation completed, versions installed are:'
echo ''
echo -n 'Node:           '
node --version
echo -n 'npm:            '
npm --version
echo -n 'Python:         '
python -V
python3 -V

# Print reminder of need to logout in order for these changes to take effect!
echo ''
echo "#### Done ###"
