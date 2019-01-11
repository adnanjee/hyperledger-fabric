http://www.acloudfan.com
https://courses.pragmaticpaths.com

This project file is a part of the course on Hyperledger Fabric.
The password for this file is available in Lecture#3 of the course. It is changed
with every new version....so please check it along with the download

Please make sure you get the latest version of this file. Download latest
at

http://acloudfan.com/download-files

Upgrade
=======
Option#1  (Preferred) Fresh install - execute the scripts in the order shown in the setup lecture

Option#2  Reuse the VM created in v1.3-2
+ Shutown the v1.3-2 VM
+ Unzip v1.3-3
+ Copy the v1.3-2/.vagrant to v1.3-3 folder
+ Start the VM under v1.3-3
+ rm -rf $HOME/kafka        & then reinstall kafka
+ docker rmi couchdb:2.2.0  & then reinstall CouchDB

Version History
===============

December     11th, 2018       v1.3-3
- Pegged the kafka version 1.1.1
- Pegged the CouchDB version to 2.2.0
- Minor bugs/mistakes
- No behavior change

November     4th, 2018        v1.3-2
Changed the scripts to address the permissions issue

November     8th, 2018        v1.3-1

PLEASE REFER to note below for upgrading from lower version to this version

- fixed the solution to exercise "  Exercise-Setup a new Channel Profile with 2 Orgs"
- Updated the setup scripts to take care of the caserver.sh setup issue
- Fixed minor issues

To upgrade you MUST create a new VM as the binaries will be switched to version 1.3
Do not forget to destroy the VM for v1.2
PS: If your earlier VM is running then the VM for v1.3 will fail to launch 

October      5, 2018        v1.2
September    26, 2018       v1.0

Updating the Repository to v1.3-1
=================================
One big difference is that this version uses the Fabric v1.3 binaries


Use {abc} in yaml