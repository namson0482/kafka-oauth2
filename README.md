# Kafka OAuth 2.0

## Build up Apache Kafka - Keycloak - OAuth 2.0

### Scenario: All components run on one computer only.
Step 1:
- Window OS: open file C:\Windows\System32\drivers\etc\hosts and add some of new lines below:
```
127.0.0.1            keycloak
127.0.0.1            kafka
```
- Mac OS: open file /etc/hosts by command: sudo vi /etc/hosts and add some of new lines above

Step 2: Unzip file, go to your folder kafka-broker-keycloak and execute one out of 2 command below:
- Build all kafka, zookeeper and keycloak
```
docker-compose -f compose.yml -f kafka/compose-all.yml up --build
```

- Build all kafka, zookeeper
```
docker-compose -f compose.yml -f kafka/compose-kafka-zookeeper.yml up --build
```

Step 3: open http://keycloak:8080 and login by **admin/admin** to go to realm demo to view client id

Step 4: get an access token by postman with values below:
```
Grant Type: client credential
http://keycloak:8080/realms/demo/protocol/openid-connect/token
client id: kafka-broker
client secret: kafka-broker-secret
scope: email
```

Step 5:
    - Mac/Linux use a command: export OAUTH2_ACCESS_TOKEN=<ACCESS_TOKEN_VALUE>
    - Window use a command: set OAUTH2_ACCESS_TOKEN=<ACCESS_TOKEN_VALUE> 
    - ACCESS_TOKEN_VALUE: take by postman above

Step 6: Open IDE such as Intellij or Eclipse to open project kafka-oauth2-client
    - Run main method in class ProducerOAuth
    - Run main method in class ConsumerOAuth

**DONE!!!**

## Build your own kafka-oauth2-server-1.0.0.jar

You use any IDE to open project kafka-oauth2-wav and use maven command to compile and build.