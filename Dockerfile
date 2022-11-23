# FROM java:8-jdk-alpine

# COPY demo-0.0.1-SNAPSHOT-1.jar /usr/app/

# WORKDIR /usr/app


# ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]

# First stage: complete build environment
FROM maven:3.5.4-jdk-8-alpine AS builder

# add pom.xml and source code
ADD ./pom.xml pom.xml
ADD ./src src/

# package jar
RUN mvn clean package
# Second stage: minimal runtime environment
From openjdk:8-jre-alpine
# copy jar from the first stage
COPY --from=builder target/demo-0.0.1-SNAPSHOT-1.jar demo-0.0.1-SNAPSHOT-1.jar

EXPOSE 8088

ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]
