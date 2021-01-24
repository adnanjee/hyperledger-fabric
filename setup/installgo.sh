#!/bin/bash

### https://github.com/adnanjee/hyperledger-fabric.git ###

### Download golang ###

echo "Downloading golang"

curl -O https://golang.org/dl/go1.15.7.linux-amd64.tar.gz

tar xvf go1.15.7.linux-amd64.tar.gz

### Moving go to /usr/local ###

sudo mv  go /usr/local

rm go1.15.5.linux-amd64.tar.gz


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
    source ~/.profile
    source ~/.bashrc


else
    echo "### No Change made to .profile ###"
fi


echo "### Done ###"
source ~/.profile
source ~/.bashrc
