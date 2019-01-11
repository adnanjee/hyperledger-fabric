block-json.sh
=============
# Extract Application group
./block-json.sh application 
# Extract Orderer group
./block-json.sh orderer 
# Extract application channel_group
./block-json.sh channel_group
 # Extract Channel policies
./block-json.sh channel_group policies
# Extract Application policies
./block-json.sh  channel_group groups.Application.policies
# Extract Application - ACLs & Policies
./block-json.sh acls




Multi Org Setup
===============
Org#1   Orderer org - dedicated org for the Orderer service
Org#2   Acme Airlines
Org#3   Budget Airlines

To Setup the Orderer
====================
Execute the ./init.sh
- Cleans the file system
- Generates the crypto materal. Uses setup/config/multi-org/crypto-config.yaml
- Generates the Genesis block and the create channel transaction
Orderer

