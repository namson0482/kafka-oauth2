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

Step 4: get an access token by postman with values below:
    Grant Type: client credential
    http://keycloak:8080/realms/demo/protocol/openid-connect/token
    client id: kafka-broker
    client secret: kafka-broker-secret
    scope: email

Step 5:
    - Mac/Linux use a command: export OAUTH2_ACCESS_TOKEN=<ACCESS_TOKEN_VALUE>
    - Window use a command: set OAUTH2_ACCESS_TOKEN=<ACCESS_TOKEN_VALUE>
    - ACCESS_TOKEN_VALUE: take by postman above

Step 6: Open IDE such as Intellij or Eclipse to open project kafka-oauth2-client
    - Run main method in class ProducerOAuth
    - Run main method in class ConsumerOAuth