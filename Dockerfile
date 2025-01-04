# Use a Gradle image to build the project
FROM gradle:jdk21-corretto-al2023 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the project files to the working directory
COPY . .

# Run Gradle to build the project and create the JAR file
RUN gradle build

# Use a base image with Java to run the application
FROM openjdk:21

# Set the working directory inside the container for the final image
WORKDIR /app

# Copy the JAR file from the builder stage to the final image
COPY --from=builder /app/build/libs/infomatica-0.0.1-SNAPSHOT.jar /app/infomatica.jar

# Specify the command to run the application
ENTRYPOINT ["java", "-jar", "/app/infomatica.jar"]
