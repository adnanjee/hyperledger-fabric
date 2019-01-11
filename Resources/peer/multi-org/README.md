Scripts
=======

All commands to be executed in the peer/multi-org folder in terminal

Set the environment
===================
To set the environment variables for the ORG
. ./set-env.sh  ORG-Name <identity>
E.g., to set the environment for acme with identity=User1
. ./set-env.sh   acme   User1

Set the identity
================
* Switch to the Org folder
* Provide the argument ORG-Name & <identity  default=admin>
. ../set-identity  ORG-Name [User-name | peer  <peer-name> | admin]

PS:
1. Incorrect user name will lead to errors at runtime
2. Identities may not be able to execute commands due to ACL :)

Create the airlinechannel Channel
=================================
The policy for the application channel creation = MAJORITY admins
This script signs the airlinechannel.tx file as acme & budget then 
then submits the channel creation transaction.

Peers need not be running but orderer has to be up

./create-airline-channel.sh

PS: 
1. This can be called only once after the orderer initialization
2. Subsequent invocation will give an error "Received version 0"

Launch the Peer
===============
Script launches the peer for specified organization
./launch-peer.sh ORG-Name

PS:
1. The acme and budget orgs are there but new orgs added by creating folders under multi-org
2. The logs for the peer will appear in the folder for the ORG

Join the Channel
================
The peer for the ORG must have been launched before this step is carried out
This will make the peer join the channel
./join-channel.sh  ORG-Name

PS:
1. Error if peer for the ORG is not running
2. Error if peer has already joined the channel

Kill ALL Peers without cleaning
===============================
killall peer

Check active ORG
================
echo $FABRIC_CFG_PATH

Sunny Day Test
==============
1. Initialize & Launch the Orderer  ./clean.sh all    ./init.sh   (orderer/multi-org)
2. Clean the peer setup             ./clean.sh                    (peer/multi-org)
3. Create the airlinechannel        ./create-airline-channel.sh
4. Launch peer for acme             ./launch-peer.sh acme
5. Join airlinechannel for acme     ./join-channel.sh acme
6. Launch peer for budget           ./launch-peer.sh budget
7. Join airlinechannel for budget   ./join-channel.sh budget

8. Install & Instantiate chaincode on acme peer
   .  ./set-env.sh acme

   peer chaincode install -n gocc -v 1.0  -p chaincode_example02
   peer chaincode instantiate  -n gocc -v 1.0 -C airlinechannel -c '{"Args":["init","a","100","b","200"]}'

   peer chaincode list --installed -C airlinechannel
   peer chaincode list --instantiated -C airlinechannel

   peer chaincode query -C airlinechannel -n gocc  -c '{"Args":["query","a"]}'
   peer chaincode invoke -C airlinechannel -n gocc  -c '{"Args":["invoke","a","b","10"]}'

9. Install chaincode on budget peer
   .  ./set-env.sh budget
   
   peer chaincode install -n gocc -v 1.0  -p chaincode_example02
   NO Need to Instantiated as chaincode is already instantiated on airlinechannel

   peer chaincode query -C airlinechannel -n gocc  -c '{"Args":["query","a"]}'


Recipe: Protecting the chaincode info
=====================================
Default ACL policy for the lscc/GetInstantiatedChaincodes: /Channel/Application/Readers
As a result all <identities> in the channel org member can invoke the command:
peer chaincode list --instantiated -C airlinechannel
peer chaincode list --installed -C airlinechannel

Change the ACL in configtx.yaml (policy.5) Such that only admins can get the info
on chaincode that have been installed/instantiated

* Hint: ACL controlling the access
lscc/GetInstantiatedChaincodes: /Channel/Application/Admins
qscc/GetChainInfo: /Channel/Application/Readers

Solution: policy.6/configtx.yaml

ACL Exercise
============
# ACL policy for cscc's "GetConfigBlock" function
    cscc/GetConfigBlock: /Channel/Application/Readers




* With just Acme test was successful  v1 & v2
* With A & B - v2 


Fetch the config
================
peer channel fetch config config_block.pb -o localhost:7050 -c ordererchannel
configtxlator proto_decode --type=common.Block --input=./config_block.pb > test.json


0. Create the channel txn file
cp $CONFIG_DIRECTORY/configtx.yaml .
copy the crypt-config folder to .
configtxgen -profile AirlineChannel -outputCreateChannelTx ./airline-channel.tx -channelID airlinechannel -asOrg Budget
peer channel create -o localhost:7050 -c airlinechannel -f airline-channel.tx


1. Create the channel using the channel transaction created earlier
================================================================
peer channel create -o localhost:7050 -c airlinechannel -f $CONFIG_DIRECTORY/airline-channel.tx

2. Join the channel
================
launch peer
peer channel join -o localhost:7050 -b ./airlinechannel.block
peer channel list

Install the test code
=====================
> peer chaincode install -n gocc -v 1.0  -p chaincode_example02

Instantiate the code
====================
> peer chaincode instantiate  -n gocc -v 1.0 -C airlinechannel -c '{"Args":["init","a","100","b","200"]}'

Query & invoke
==============
peer chaincode query -C airlinechannel -n gocc  -c '{"Args":["query","a"]}'
peer chaincode invoke -C airlinechannel -n gocc  -c '{"Args":["invoke","a","b","10"]}'


Error in creating channel
=========================
/Channel/Application

When wrong MSP used while creating a channel we got an error
Error: got unexpected status: BAD_REQUEST -- error authorizing update: error validating DeltaSet: policy for [Group]  /Channel/Application not satisfied: Failed
to reach implicit threshold of 1 sub-policies, required 1 remaining

# Observation - if 
  Channel:
    Policies:
      writers changed to "MAJORITY Writers" the create fails