FROM openjdk:21
EXPOSE 8080
ADD build/libs/infomatica-0.0.1-SNAPSHOT.jar infomatica.jar
ENTRYPOINT ["java", "-jar", "/infomatica.jar"]