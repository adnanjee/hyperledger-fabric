# Generates the orderer | generate genesis block for ordererchannel
export ORDERER_GENERAL_LOGLEVEL=debug
export FABRIC_CFG_PATH=`pwd`

# Create the Genesis Block
echo    '================ Writing Genesis Block ================'
configtxgen -profile AirlineOrdererGenesis -outputBlock ./airline-genesis.block -channelID ordererchannel
