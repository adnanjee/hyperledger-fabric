# Generates the orderer | generate genesis block for ordererchannel

BASE_CONFIG_DIR=../../setup/config/multi-org

export ORDERER_GENERAL_LOGLEVEL=debug

# Create the Genesis Block
echo    '================ Writing Genesis Block ================'
configtxgen -profile AirlineOrdererGenesis -outputBlock ./airline-genesis.block -channelID ordererchannel

#3. Create the airline channel transaction
echo    '================ Writing airlinechannel ================'
configtxgen -profile AirlineChannel -outputCreateChannelTx ./airline-channel.tx -channelID airlinechannel

echo    '======= Done. Launch by executing orderer ======'
