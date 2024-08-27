# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Compile the application (if necessary)
RUN ./mvnw package

# Run the application
CMD ["java", "-jar", "target/java-calculator-1.0-SNAPSHOT.jar"]

