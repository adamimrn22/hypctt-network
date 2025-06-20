for orderer
openssl req -x509 -newkey rsa:2048 -nodes -keyout fabric-ca/ordererOrg/hypctt.com/tls-key.pem -out fabric-ca/ordererOrg/hypctt.com/tls-cert.pem -days 365 -config san/san-orderer.cnf -extensions v3_req

for org1
openssl req -x509 -newkey rsa:2048 -nodes -keyout fabric-ca/peerOrg/hypctt.com/org1/tls-key.pem -out fabric-ca/peerOrg/hypctt.com/org1/tls-cert.pem -days 365 -config san/san-peer-org1.cnf -extensions v3_req

for org 2
openssl req -x509 -newkey rsa:2048 -nodes -keyout fabric-ca/peerOrg/hypctt.com/org2/tls-key.pem -out fabric-ca/peerOrg/hypctt.com/org2/tls-cert.pem -days 365 -config san/san-peer-org2.cnf -extensions v3_req

cp fabric-ca/ordererOrg/hypctt.com/tls-cert.pem crypto-config/ordererOrg/hypctt.com/ca-orderer-tls.pem
cp fabric-ca/peerOrg/hypctt.com/org1/tls-cert.pem crypto-config/peerOrg/hypctt.com/ca-orderer-tls.pem
cp fabric-ca/peerOrg/hypctt.com/org2/tls-cert.pem crypto-config/peerOrg/hypctt.com/ca-orderer-tls.pem
