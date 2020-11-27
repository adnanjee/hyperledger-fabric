#!/bin/bash

### https://github.com/adnanjee/hyperledger-fabric.git ###

export PATH=$PATH:$GOROOT/bin

source ~/.profile
source ~/.bashrc

echo "GOPATH=$GOPATH"
echo "GOROOT=$GOROOT"

echo "### Starting to Download Fabric ###"

sudo bash fabric-bootstrap.sh 2.2.1 1.4.9

echo "### Copy the binaries from fabric-samples/bin to /usr/local/bin ###"

sudo cp fabric-samples/bin/*    /usr/local/bin

echo "### Copy the binaries from fabric-samples/bin to bin folder for future use ###"

mkdir -p ${PWD}/../bin
cp fabric-samples/bin/*    ${PWD}/../bin
cp -r fabric-samples ${PWD}/../
sudo rm -r fabric-samples

source ~/.profile
source ~/.bashrc

echo "### Installaion is completed ###"
