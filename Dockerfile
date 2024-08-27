# Step 1: Use Maven to build the application
FROM maven:3.8.5-openjdk-11 AS build

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the application source code into the container
COPY . /app

# Step 4: Run unit tests and package the application
RUN mvn clean test && mvn package

# Step 5: Use a smaller base image for running the application
FROM openjdk:11-jre-slim

# Step 6: Set the working directory inside the container
WORKDIR /app

# Step 7: Copy the JAR file from the build stage
COPY --from=build /app/target/java-calculator-1.0-SNAPSHOT.jar /app/java-calculator.jar

# Step 8: Specify the command to run the application
CMD ["java", "-jar", "java-calculator.jar"]

# Optional: Add metadata to the image
LABEL org.opencontainers.image.source="https://github.com/ashravank/Java-calculator"
LABEL org.opencontainers.image.revision="ea76e8a963e0d08683e0a1a3c5035fddfb301c43"
LABEL org.opencontainers.image.created="2024-08-27T18:08:40Z"
LABEL org.opencontainers.image.url="https://github.com/ashravank/Java-calculator"
