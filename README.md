# Apache Kafka 2.8.2 OAuth 2.0

## Build up Apache Kafka 2.8.2 - Keycloak 19.0.1 - OAuth 2.0

### Scenario: All components run on a same computer only.

### Prerequisite:
- Make sure that the following ports on your host machine are free: 9092, 2181 (Kafka), 8080 (Keycloak), 8443 (Keycloak).

**Step 1:**
- Window OS: open file C:\Windows\System32\drivers\etc\hosts and add some of new lines below:
```
127.0.0.1            keycloak
127.0.0.1            kafka
```
- MacOS: open file /etc/hosts by command: sudo vi /etc/hosts and add some of new lines above
  docker-compose -f compose.yml -f kafka/compose-all.yml up --build
-
**Step 2:** Go to your folder kafka-broker-keycloak-2.8.2 and execute one out of 2 command below:
- Build all kafka, zookeeper and keycloak
```
docker-compose -f compose.yml -f kafka/compose-all.yml up --build
```
- Build all kafka, zookeeper
```
docker-compose -f compose.yml -f kafka/compose-kafka-zookeeper.yml up --build
```

**Step 3:** Open http://keycloak:8080 and login by admin/admin to go to realm demo to view client id and client secret. You also can create new data by yourself.

**Step 4:**
- Download the latest compilation of ReadyAPI and install it into your computer, you can use URL below to download - it is not the latest version ReadyAPI
- https://s3.us-east-1.amazonaws.com/readyapi.dev/readyapi-3.42.0-SNAPSHOT-936059b/ReadyAPI-x64-3.42.0-SNAPSHOT.exe?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA36R6UDHHBP5Q3BRY%2F20221021%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20221021T131108Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=dbd9984ec85d770acd2a1b41786825c1a359c8f8bfb6bbd13b0c19c6f3dbd9df

**Step 5:**
- Open ReadyAPI app and import a project from example folder.
- Open Auth Manager Form get a new Access Token from Authorization server. If it doesn't exist OAuth 2.0 here then you need to create a new one with OAuth 2.0.
- Go to Publisher/Subscriber and choose an item from combobox of Authorization profile.

**URL get Access Tokens from Keycloak**
```
Access Token URL: http://keycloak:8080/realms/demo/protocol/openid-connect/token
body: x-www-form-urlencoded
client id: kafka-broker
client secret: kafka-broker-secret
scope: email
grant type: client credentials
Method Request: POST
```
![](kafka-oauth2-wav/images/img_1.png)

**URL introspect access tokens**
```
Access Token Introspect URL: http://keycloak:8080/realms/demo/protocol/openid-connect/token/introspect
body: x-www-form-urlencoded
token: <TOKEN_VALUE>
client_id: <CLIENT_ID>
client_secret: <CLIENT_SECRET>
Method Request: POST
```
![](kafka-oauth2-wav/images/img.png)****

Notes: If you restart your docker engine then you need to start the components following this order: keycloak -> zookeeper -> kafka.

**DONE!!!**
-----------

## Additional server side: Build your own kafka-oauth2-wav-1.0.0.jar

If you change/modify source code in kafka-oauth2-wav as your requirement then you just execute a command below:
```
mvn clean package
```
The command build successfully then a new jar file will create and copy into kafka-broker-keycloak/kafka/libs. Once you execute docker-compose command above. This jar file will copy into Kafka library.