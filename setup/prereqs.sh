#!/bin/bash
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Usage:
#
# ./prereqs-ubuntu.sh
#
# User must then logout and login upon completion of script
#

# Exit on any failure
set -e

# Array of supported versions
declare -a versions=('trusty' 'xenial' 'yakkety', 'bionic', 'cosmic', 'disco', 'focal', 'tessa');

# check the version and extract codename of ubuntu if release codename not provided by user
if [ -z "$1" ]; then
    source /etc/lsb-release || \
        (echo "Error: Release information not found, run script passing Ubuntu version codename as a parameter"; exit 1)
    CODENAME=${DISTRIB_CODENAME}
else
    CODENAME=${1}
fi

# check version is supported
if echo ${versions[@]} | grep -q -w ${CODENAME}; then
    echo "Installing Hyperledger prereqs for Ubuntu ${CODENAME}"
else
    echo "Error: Ubuntu ${CODENAME} is not supported"
    exit 1
fi

# Update package lists
echo "# Updating package lists"
sudo apt-add-repository -y ppa:git-core/ppa
sudo apt-get update

#Install curl

echo "# Installing curl"
sudo apt-get install -y curl

# Install node
sudo apt install nodejs

# Ensure that CA certificates are installed
sudo apt-get -y install apt-transport-https ca-certificates

# Install python v2 and v3 

   sudo apt-get install -y python
   sudo apt-get install -y python3
   
# Install unzip, required to install hyperledger fabric.
sudo apt-get -y install unzip

. ~/.profile
. ~/.bashrc

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
