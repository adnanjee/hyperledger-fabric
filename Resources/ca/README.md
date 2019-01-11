Documetation
============
http://hyperledger-fabric-ca.readthedocs.io/en/latest/users-guide.html


Launch Server with start
========================
fabric-ca-server   start –n simpleca -b   admin:adminpw

Copy the JSON from https://github.com/hyperledger/fabric-ca/blob/master/swagger/swagger-fabric-ca.json 
to Swagger Editor at https://editor.swagger.io/

Invoke the REST API (GET) from Browser. The base URL would be http://localhost:7054/api/v1

http://localhost:7054/api/v1/cainfo
http://localhost:7054/api/v1/identities

Use the client
==============
- Enroll the admin
export FABRIC_CA_CLIENT_HOME=/vagrant/ca/client/admin
fabric-ca-client enroll -u http://admin:adminpw@localhost:7054

- Manage affiliations
fabric-ca-client affiliation list
fabric-ca-client affiliation org6
fabric-ca-client affiliation modify org2 --name org5

* Create an identity using 
fabric-ca-client identity add user1 --json '{"secret": "user1pw", "type": "user", "affiliation": "org1", "max_enrollments": 1, "attrs": [{"name": "hf.Revoker", "value": "true"}]}'

* Modify the identity for higher enrollments
fabric-ca-client identity modify --maxenrollments 2

fabric-ca-client register --id.name user1 --id.secret user1pw --id.type user --id.affiliation org1 --id.attrs 'app1Admin=true:ecert,email=user1@gmail.com'

* Go in as user1
export FABRIC_CA_CLIENT_HOME=/vagrant/fabric-ca/client/user1
fabric-ca-client enroll -u http://user1:user1pw@localhost:7054


http://hyperledger-fabric-ca.readthedocs.io/en/latest/users-guide.html#install

To Install binaries
===================
export GOPATH=/vagrant/gopath
sudo apt install libtool libltdl-dev
go get -u github.com/hyperledger/fabric-ca/cmd/...

Got error >> # github.com/hyperledger/fabric-ca/lib
../go/src/github.com/hyperledger/fabric-ca/lib/server.go:714:23: cert.Issuer.String undefined (type pkix.Name has no field or method String)
../go/src/github.com/hyperledger/fabric-ca/lib/server.go:715:24: cert.Subject.String undefined (type pkix.Name has no field or method String)

Make the CA binaries from source
================================
cd ~/temp
sudo git clone -b release-1.2 https://github.com/hyperledger/fabric-ca.git
cd fabric-ca
sudo make all
sudo cp fabric-ca/build/image/fabric-ca/payload/fabric-ca-server /usr/local/bin
sudo cp fabric-ca/build/image/fabric-ca/payload/fabric-ca-client /usr/local/bin





sudo mv fabric-ca $GOPATH/src/github.com/hyperledger

Pull & Make
===========
mkdir temp
cd temp
git clone https://LFID@gerrit.hyperledger.org/r/a/fabric-ca
git clone https://acloudfan@gerrit.hyperledger.org/r/a/fabric-ca
cd fabric-ca
sudo make all

/vagrant/fabric-ca/temp/fabric-ca/build/docker/bin$ sudo cp *    /usr/local/bin

rm -rf temp

cd ~/temp
sudo git clone https://gerrit.hyperledger.org/r/fabric-ca
cd fabric-ca
sudo make all