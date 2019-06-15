#!/bin/bash

### https://github.com/adnanjee/hyperledger-fabric-1.4.1.git ###

export PATH=$PATH:$GOROOT/bin

# Sets up the fabric-ca-server & fabric-ca-client
sudo apt install -y libtool libltdl-dev

# Document process leads to errors as it leads to pulling of master branch
go get -u github.com/hyperledger/fabric-ca/cmd/...

# git clone --branch release-1.3 https://github.com/hyperledger/fabric-ca.git
# rm -rf $GOPATH/src/github.com/hyperledger/fabric-ca 2> /dev/null
# mv fabric-ca  $GOPATH/src/github.com/hyperledger
# go install github.com/hyperledger/fabric-ca/cmd/...

sudo cp $GOPATH/bin/*    /usr/local/bin

cp $GOPATH/bin/*    ${PWD}/../bin

sudo rm $GOPATH/bin/* 

. ~/.profile
. ~/.bashrc

echo "Done. please confirm your installaion by issuing commands fabric-ca-server version & fabric-ca-client version"


