# Initialize the orderer | generate genesis block for ordererchannel

BASE_CONFIG_DIR=../../setup/config/multi-org

export ORDERER_GENERAL_LOGLEVEL=debug


#1. Remove files
echo   '=======Deleting artifacts from file system ====='
rm *.tx
rm *.block
rmdir -rf ./temp
rm -rf /home/vagrant/ledgers/orderer/multi-org/ledger

#2. Setup cryptogen for 
echo    '================ Generating crypto-config ================'
rm -rf ./crypto-config 2> /dev/null
cryptogen generate --config=$BASE_CONFIG_DIR/crypto-config.yaml

configtxgen -profile AirlineOrdererGenesis -outputBlock ./airline-genesis.block -channelID ordererchannel

#3. Create the airline channel transaction
echo    '================ Writing acmechannel ================'
configtxgen -profile AirlineChannel -outputCreateChannelTx ./airline-channel.tx -channelID airlinechannel

echo    '======= Done. Launch by executing orderer ======'
