Step 1:
	- Window OS: open file C:\Windows\System32\drivers\etc\hosts and add some of new lines below:
		127.0.0.1            keycloak
		127.0.0.1            kafka
	- Mac OS: open file /etc/hosts by command: sudo vi /etc/hosts and add some of new lines below:
		127.0.0.1            keycloak
		127.0.0.1            kafka
		

Step 2: Unzip file, go to your folder kafka-broker-keycloak and execute one out of two command below:
    - you need to install all components such as kafka, zookeeper and keycloak
    docker-compose -f compose.yml -f kafka/compose-all.yml up --build
    - If you already got installation for keycloak then you only need to install kafka and zookeeper then you execute a command:
    docker-compose -f compose.yml -f kafka/compose-kafka-zookeeper.yml up --build

Step 3: open http://keycloak:8080 and login by admin/admin to go to realm demo to view client id

Step 4: 
	- Download ReadyAPI from URL:
	https://s3.us-east-1.amazonaws.com/readyapi.dev/readyapi-3.42.0-SNAPSHOT-936059b/ReadyAPI-x64-3.42.0-SNAPSHOT.exe?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA36R6UDHHBP5Q3BRY%2F20221021%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20221021T131108Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=dbd9984ec85d770acd2a1b41786825c1a359c8f8bfb6bbd13b0c19c6f3dbd9df
	
	- Open ReadyAPI app and import a project from example and check Apache Kafka OAuth 2

Further information - URL get Access Tokens from Keycloak:
    - http://keycloak:8080/realms/demo/protocol/openid-connect/token
    - client id: kafka-broker
    - client secret: kafka-broker-secret
Pay Attention: This guideline is only effective  for scenario: All components will run on one computer only. If you want to run with other scenario then we need to change configuration
DONE!!!