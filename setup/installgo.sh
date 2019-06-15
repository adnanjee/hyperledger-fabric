#!/bin/bash

### https://github.com/adnanjee/hyperledger-fabric-1.4.1 ###

### Download golang ###

echo "Downloading golang"

curl -O https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz

tar xvf go1.12.6.linux-amd64.tar.gz

### Moving go to /usr/local ###

sudo mv  go /usr/local

rm go1.12.6.linux-amd64.tar.gz


# If GOROOT already set then DO Not set it again
if [ -z $GOROOT ]
then
    echo "export GOROOT=/usr/local/go" >> ~/.profile
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
    echo "export GOPATH=/home/$USER/gopath" >> ~/.profile
    echo "### Updated .profile with GOROOT/GOPATH/PATH ###"

    echo "export GOROOT=/usr/local/go" >> ~/.bashrc
    echo "export GOPATH=/home/$USER/gopath" >> ~/.bashrc
    echo "### Updated .profile with GOROOT/GOPATH/PATH ###"


else
    echo "### No Change made to .profile ###"
fi

. ~/.profile
. ~/.bashrc

echo "### Done ###"
