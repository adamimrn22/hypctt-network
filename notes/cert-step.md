step to generate cert

for orderer

export FABRIC_CA_CLIENT_HOME=$PWD/crypto-config/ordererOrg/hypctt.com

export FABRIC_CA_CLIENT_TLS_CERTFILES=$PWD/crypto-config/ordererOrg/hypctt.com/ca-orderer-tls.pem

fabric-ca-client enroll -u https://admin:adminpw@ca-orderer.hypctt.com:7030 --caname ca-orderer --tls.certfiles $PWD/crypto-config/ordererOrg/hypctt.com/ca-orderer-tls.pem

fabric-ca-client register --caname ca-orderer --id.name orderer1-tls --id.secret orderer1tlspw --id.type orderer

fabric-ca-client enroll -u https://orderer1-tls:orderer1tlspw@ca-orderer.hypctt.com:7030 --caname ca-orderer -M $PWD/crypto-config/ordererOrg/hypctt.com/orderers/orderer1.hypctt.com/tls --enrollment.profile tls --tls.certfiles $PWD/crypto-config/ordererOrg/hypctt.com/ca-orderer-tls.pem --csr.hosts orderer1.hypctt.com

fabric-ca-client enroll -u https://orderer1:orderer1pw@ca-orderer.hypctt.com:7030 --caname ca-orderer -M $PWD/crypto-config/ordererOrg/hypctt.com/orderers/orderer1.hypctt.com/msp --tls.certfiles $PWD/crypto-config/ca-orderer-tls.pem
