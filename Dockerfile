FROM openjdk:8-jdk-alpine
RUN addgroup -S drugstore && adduser -S admin -G drugstore
USER admin:drugstore
VOLUME /tmp
ARG JAR_FILE=target/*.jar
ADD target/${JAR_FILE} app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
