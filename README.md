Adnan Iftekahr ( adnan.iftekhar.ch@gmail.com )
https://github.com/adnanjee/hyperledger-fabric.git

Always check for latest versions before installing these scripts

Please pay attention to your $GOPATH. This setup assuming that you are making fresh installaions.
This installaion will set the parent directory of setup folder as your $GOPATH.
If you already installed go language please pay attention to your already exist $GOPATH. 
It will not update your already set $GOPATH. To check run the following comman in terminal: echo $GOPATH
This installaion assumes that your $GOPATH is parent directory of setup folder.

1) open terminal and clone repository $ git clone https://github.com/adnanjee/hyperledger-fabric.git or download directly to home directory.
2) $ cd hyperledger-fabric/setup
3) $ chmod u+x *   (For autoinstall run ./autoinstall.sh and skip the next steps)
4) $ ./prereqs.sh
5) $ ./installgo.sh 
6) $ ./installdocker.sh
4) $ ./fabric-setup.sh
5) $ ./caserver-setup.sh
6) $ ./jq.sh

For node and python installation please run dev-env.sh

You fabric is ready in native environment. Fabric-Samples folder has all the scripts to run your business network on fabric. 
