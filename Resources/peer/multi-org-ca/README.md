multi-org-ca Peer Scripts
=========================

1. Environment scripts:

    set-identity.sh
    ===============
    This script sets the variables from the identity perspective. 

    USAGE:   . set-identity.sh  ORG-Name [identity  defult=admin]

    set-env.sh
    ==========
    This script will set the environment variables for the PEER in a specific ORG. MUST be used with a '.'
    otherwise the environment vars will not take effect

    USAGE:   . set-env.sh   ORG_NAME   PEER_NAME  [PORT_NUMBER_BASE default=7050]  [Identity]

    If Identity is provided then the peer command executed with the MSP for that identity instead of
    the MSP for the peer

    show-env.sh
    ===========
    Shows the current environment setup for the peer. It is suggested that after using the 'set' script
    always use this script to ensure that the environment variables are set

    USAGE:   ./show-env.sh
    
2. Channel Scripts:

    sign-channel-tx.sh  T.B.D.
    ==========================
    Signs the airline channel file with the specified ORG's admin. 

    join-airline-channel.sh
    =======================
    Makes the specified peer join the channel.



Phase-1 Setup - Clean start
===========================
In phase 1 only two organizations will be setup 
- acme
- orderer

Orderer
------
1. Make sure you start clean - execute      
    ./clean.sh
2. Create the peer identity                 
    ./register-enroll-peer.sh    acme   peer1
3. Generate the genesis
4. Generate the channel tx file
5. Launch orderer

Peer (acme peer1)
-----------------
1. Make sure you start clean - execute   
    ./killall.sh
    ./clean-peer-ledger-folder.sh acme peer1
2. Sign the channel. In phase 1 its optional as there is only 1 member org
    ./sign-channel-tx.sh  acme
3. Create the channel
    ./submit-create-channel.sh acme
4. Launch the peer
    ./launch-peer.sh   acme    peer1
5. Join the channel
    ./join-airline-channel.sh acme peer1 7050
6. Validate the peer
    peer channel list

