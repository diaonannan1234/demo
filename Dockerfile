FROM java:8-jdk-alpine

COPY demo-0.0.1-SNAPSHOT-1.jar /usr/app/

WORKDIR /usr/app


ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]