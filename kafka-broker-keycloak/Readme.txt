Prerequisite:
    - Make sure that the following ports on your host machine are free: 9092, 2181 (Kafka), 8080 (Keycloak), 8443 (Keycloak).

Step 1:
	- Window OS: open file C:\Windows\System32\drivers\etc\hosts and add some of new lines below:
		127.0.0.1            keycloak
		127.0.0.1            kafka
	- Mac OS: open file /etc/hosts by command: sudo vi /etc/hosts and add some of new lines below:
		127.0.0.1            keycloak
		127.0.0.1            kafka
		

Step 2: Go to your folder kafka-broker-keycloak-2.8.2 and execute commands below:
    - You may want to remove any old containers to start clean:
        docker rm -f kafka zookeeper keycloak
    - You may want to remove any old images to start clean:
        docker rmi $(docker images -q)
    - you need to install all components such as kafka, zookeeper and keycloak
        docker-compose -f compose.yml -f kafka/compose-all.yml up --build
    - If you already got installation for keycloak then you only need to install kafka and zookeeper then you execute a command:
        docker-compose -f compose.yml -f kafka/compose-kafka-zookeeper.yml up --build

Step 3: Open http://keycloak:8080 and login by admin/admin to go to realm demo to view client id and client secret. You also can create new data by yourself.

Step 4: 
	- Download the latest ReadyAPI from SmartBear website, you also can use the URL below to download:
	- https://s3.us-east-1.amazonaws.com/readyapi.dev/readyapi-3.42.0-SNAPSHOT-936059b/ReadyAPI-x64-3.42.0-SNAPSHOT.exe?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA36R6UDHHBP5Q3BRY%2F20221021%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20221021T131108Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=dbd9984ec85d770acd2a1b41786825c1a359c8f8bfb6bbd13b0c19c6f3dbd9df

Step 5:
	- Open ReadyAPI app and import a project from example and check Apache Kafka OAuth 2.
	- Open Auth Manager Form get a new Access Token from Authorization server. If it doesn't exist OAuth 2.0 here then you need to create a new one with OAuth 2.0.
    - Go to Publisher/Subscriber and choose an item from combobox of Authorization profile Combobox.

Further information - URL get Access Tokens from Keycloak:
    - http://keycloak:8080/realms/demo/protocol/openid-connect/token
    - client id: kafka-broker
    - client secret: kafka-broker-secret
    - scope: email
    - grant type: client credentials
    - Method Request: POST

Information introspect access tokens
    - Access Token Introspect URL: http://keycloak:8080/realms/demo/protocol/openid-connect/token/introspect
    - body: x-www-form-urlencoded
    - token: <TOKEN_VALUE>
    - client_id: <CLIENT_ID>
    - client_secret: <CLIENT_SECRET>
    - Method Request: POST

Pay Attention: This guideline is only effective  for scenario: All components will run on one computer only. If you want to run with other scenario then we need to change configuration
DONE!!!