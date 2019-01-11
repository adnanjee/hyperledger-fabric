# Generates the orderer | generate the airline channel transaction

export ORDERER_GENERAL_LOGLEVEL=debug

function usage {
    echo "./generate-channel-tx.sh "
    echo "     Creates the airline-channel.tx for the channel airlinechannel"
}

echo    '================ Writing airlinechannel ================'

configtxgen -profile AirlineChannel -outputCreateChannelTx ./airline-channel.tx -channelID airlinechannel

echo    '======= Done. Launch by executing orderer ======'
