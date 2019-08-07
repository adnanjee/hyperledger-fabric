#!/bin/bash

### https://github.com/adnanjee/hyperledger-fabric-1.4.git ###

export PATH=$PATH:$GOROOT/bin

. ~/.profile
. ~/.bashrc

echo "GOPATH=$GOPATH"
echo "GOROOT=$GOROOT"

echo "### Starting to Download Fabric ###"

curl -sSL https://bit.ly/2ysbOFE | bash -s -- 1.4.2 1.4.2 0.4.15

echo "### Copy the binaries from fabric-samples/bin to /usr/local/bin ###"

sudo cp fabric-samples/bin/*    /usr/local/bin

echo "### Copy the binaries from fabric-samples/bin to bin folder for future use ###"

mkdir -p ${PWD}/../bin
cp fabric-samples/bin/*    ${PWD}/../bin

# The sample chaincode is under the subfolder go and need to come under gopath/src subfolder

echo "### Setting up the src folder under $GOPATH /gopath/src ###"

mkdir -p $GOPATH/src

echo "### copying chaincodes from fabric-samples folder in gopath/src folder ###"

cp -r fabric-samples/chaincode/chaincode_example02/*    $GOPATH/src

# Move fabric-samples to hyperledger-1.3.0 directory

mv fabric-samples ${PWD}/../ 

# This downloads the shim code 

echo "### Setting up the HLF Shim ###"

mkdir -p  $GOPATH/src/github.com/hyperledger
go get -u --tags nopkcs11 github.com/hyperledger/fabric/core/chaincode/shim

. ~/.profile
. ~/.bashrc

echo "### Installaion is completed ###"
