# Scripts
./clean.sh      Cleans the ledger
./clean.sh      Cleans the ledger + all generated artifacts

./init.sh       Cleans and regenerate the orderer artifacts 
                Use it if you have made changes to configtx.yaml | orderer.yaml
./init.sh       Overwrites configtx.yaml and orderer.yaml before initializing the setup

./launch.sh     Launches the orderer

#1 Use the crypto-config.yaml folder under the cryptogen/simple-two-org folder
> cryptogen generate --config=../../cryptogen/simple-two-org/crypto-config.yaml

#2 Copy the file configtxgen/configtx.yaml to the current folder

export FABRIC_CFG_PATH=$PWD
export ORDERER_GENERAL_LOGLEVEL=debug

Generate the genesis.block file
===============================
- Default chain id = testchainid        
> configtxgen -profile AcmeOrdererGenesis -outputBlock ./acme-genesis.block 
- Provide the channel ID
> configtxgen -profile AcmeOrdererGenesis -outputBlock ./acme-genesis.block -channelID ordererchannel

Generate the Channel Tx
=======================
> configtxgen -profile AcmeChannel -outputCreateChannelTx ./acme-channel.tx -channelID acmechannel

Setup Kafka
===========
1. Launch Kafka
2. Check the topics

1. Execute the ./clean.sh to clear up the orderer 
2. Make a change to the configtx
    OrdererType: kafka
    Addresses:
        - localhost:9092            <<Bootstrap Broker Address>>
3. Generate the genesis block
4. Launch Orderer

5. Check the topics - we will see the ordererchannel as one of the topics

