#!/bin/bash

### https://github.com/adnanjee/hyperledger-fabric-1.4.0.git ###

### Download golang ###

echo "Downloading golang"

curl -O https://dl.google.com/go/go1.11.4.linux-amd64.tar.gz

tar xvf go1.11.4.linux-amd64.tar.gz

### Moving go to /usr/local ###

sudo mv  go /usr/local

rm go1.11.4.linux-amd64.tar.gz


# If GOROOT already set then DO Not set it again
if [ -z $GOROOT ]
then
    echo "export GOROOT=/usr/local/go" >> ~/.profile
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
    echo "export GOPATH=${PWD}/../gopath" >> ~/.profile
    echo "### Updated .profile with GOROOT/GOPATH/PATH ###"

    echo "export GOROOT=/usr/local/go" >> ~/.bashrc
    echo "export GOPATH=${PWD}/../gopath" >> ~/.bashrc
    echo "### Updated .profile with GOROOT/GOPATH/PATH ###"


else
    echo "### No Change made to .profile ###"
fi

echo "### Done. PLEASE LOG OUT & LOG Back In and validate by executing go version"
